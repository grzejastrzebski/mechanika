# ============================================================
#  start.ps1  —  uruchamia pracę nad projektem "mechanika"
#  1) wchodzi do folderu repo (tam, gdzie leży ten skrypt)
#  2) synchronizuje z GitHubem (git pull)
#  3) odpala Claude Code
# ============================================================

# Przejdź do folderu, w którym leży ten skrypt (czyli do repo) —
# dzięki temu działa tak samo na komputerze i na laptopie, bez względu na ścieżkę.
Set-Location -Path $PSScriptRoot

Write-Host ""
Write-Host "==> Synchronizuje z GitHubem (git pull)..." -ForegroundColor Cyan
git pull

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Uwaga: git pull zglosil problem (np. konflikt) - sprawdz komunikat powyzej." -ForegroundColor Yellow
    Write-Host "Mimo to uruchamiam Claude Code - mozesz go poprosic o pomoc z synchronizacja." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==> Uruchamiam Claude Code..." -ForegroundColor Green
Write-Host ""
claude
