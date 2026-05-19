# Export SVG icons from Figma — Job Finder UI App Kit
# Usage:
#   $env:FIGMA_TOKEN = "your-personal-access-token"
#   .\scripts\export_figma_icons.ps1
#
# Token: Figma → Settings → Security → Personal access tokens

param(
    [string]$FileKey = "O4y5fMUKjyXNnx58j68d2P",
    [string]$OutDir = "assets\icons\figma"
)

$ErrorActionPreference = "Stop"
$token = $env:FIGMA_TOKEN
if (-not $token) {
    Write-Host "ERROR: Set FIGMA_TOKEN environment variable first." -ForegroundColor Red
    Write-Host "  Figma → Account Settings → Personal access tokens"
    exit 1
}

$headers = @{ "X-Figma-Token" = $token }
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
if (Test-Path (Join-Path $PSScriptRoot "..\pubspec.yaml")) {
    $projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
} else {
    $projectRoot = Get-Location
}
$outPath = Join-Path $projectRoot $OutDir
New-Item -ItemType Directory -Force -Path $outPath | Out-Null

Write-Host "Fetching Figma file $FileKey ..."
$file = Invoke-RestMethod -Uri "https://api.figma.com/v1/files/$FileKey" -Headers $headers

$iconNodes = @{}
function Walk-Node($node, $path) {
    $name = $node.name
    $id = $node.id
    $type = $node.type
    $fullPath = if ($path) { "$path/$name" } else { $name }

    $isIcon = $name -match '(?i)icon|ic_|ic-|logo|google|home|search|profile|arrow|eye|upload|pdf|delete|check|lock|key|mail|bookmark|briefcase|notification|message|plus|add'
    $isExportable = $type -in @('COMPONENT', 'COMPONENT_SET', 'FRAME', 'GROUP', 'VECTOR', 'BOOLEAN_OPERATION')

    if ($isIcon -and $isExportable -and $node.children.Count -eq 0 -or ($type -eq 'COMPONENT')) {
        $safeName = ($name -replace '[^\w\-]', '_').ToLower()
        if ($safeName -and -not $iconNodes.ContainsKey($id)) {
            $iconNodes[$id] = $safeName
        }
    }

    foreach ($child in $node.children) {
        Walk-Node $child $fullPath
    }
}

Walk-Node $file.document ""

# Also scan pages named Icons
foreach ($page in $file.document.children) {
    if ($page.name -match '(?i)icon') {
        Walk-Node $page $page.name
    }
}

if ($iconNodes.Count -eq 0) {
    Write-Host "No icon nodes matched. Exporting top-level components ..."
    foreach ($page in $file.document.children) {
        foreach ($child in $page.children) {
            if ($child.type -eq 'COMPONENT' -or $child.type -eq 'COMPONENT_SET') {
                $safeName = ($child.name -replace '[^\w\-]', '_').ToLower()
                $iconNodes[$child.id] = $safeName
            }
        }
    }
}

if ($iconNodes.Count -eq 0) {
    Write-Host "No components found. Open file in Figma and ensure icons are Components." -ForegroundColor Yellow
    exit 1
}

Write-Host "Found $($iconNodes.Count) nodes. Requesting SVG export ..."
$ids = ($iconNodes.Keys -join ',')
$encodedIds = [uri]::EscapeDataString($ids)
$imgResp = Invoke-RestMethod -Uri "https://api.figma.com/v1/images/${FileKey}?ids=${encodedIds}&format=svg" -Headers $headers

$count = 0
foreach ($entry in $imgResp.images.PSObject.Properties) {
    $nodeId = $entry.Name
    $url = $entry.Value
    if (-not $url) { continue }
    $fileName = "$($iconNodes[$nodeId]).svg"
    $dest = Join-Path $outPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $dest
    $count++
    Write-Host "  $fileName"
}

Write-Host "Done. Exported $count icons to $outPath" -ForegroundColor Green
Write-Host "Run: flutter pub get && flutter run"
