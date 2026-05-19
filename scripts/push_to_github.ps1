# Push lab1_mobile_n2 to GitHub
# Repo: https://github.com/trunthong09012005/TranTrungThong_6451071075_Lab1_N1

$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/trunthong09012005/TranTrungThong_6451071075_Lab1_N1.git"
$root = Split-Path $PSScriptRoot -Parent

Set-Location $root

if (-not (Test-Path ".git")) {
    Write-Host "Initializing git..."
    git init
    git branch -M main
}

$remote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    git remote add origin $repoUrl
    Write-Host "Added remote origin"
} elseif ($remote -ne $repoUrl) {
    git remote set-url origin $repoUrl
    Write-Host "Updated remote origin"
}

$status = git status --porcelain
if ($status) {
    git add -A
    git commit -m "Update lab1_mobile_n2 Flutter job finder app"
}

Write-Host "Pushing to origin main..."
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "Done: $repoUrl" -ForegroundColor Green
} else {
    Write-Host @"

Push failed. Common fixes:
1. Login: gh auth login   (or use Git Credential Manager)
2. If remote has README, run once:
   git pull origin main --rebase --allow-unrelated-histories
   git push -u origin main
"@ -ForegroundColor Yellow
}
