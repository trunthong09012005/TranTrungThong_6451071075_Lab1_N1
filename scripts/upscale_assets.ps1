# Upscale small PNG assets for sharper display on retina screens.
param([double]$Scale = 5.0)

Add-Type -AssemblyName System.Drawing

function Upscale-Png($path, $factor) {
    $img = [System.Drawing.Image]::FromFile($path)
    $nw = [math]::Max(1, [int]($img.Width * $factor))
    $nh = [math]::Max(1, [int]($img.Height * $factor))
    $bmp = New-Object System.Drawing.Bitmap $nw, $nh
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.DrawImage($img, 0, 0, $nw, $nh)
    $g.Dispose()
    $img.Dispose()
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "  -> ${nw}x${nh}"
}

$root = Join-Path (Split-Path $PSScriptRoot -Parent) "assets\images"
Write-Host "Upscaling images in $root (x$Scale)..."

$scales = @{
    "logo_app.png" = 3.0
    "onboarding_illustration.png" = 2.5
    "illust_forgot_password.png" = 5.0
    "illust_check_email.png" = 5.0
    "illust_success.png" = 5.0
}

foreach ($name in $scales.Keys) {
    $file = Join-Path $root $name
    if (Test-Path $file) {
        Write-Host $name
        Upscale-Png $file $scales[$name]
    }
}
Write-Host "Done."
