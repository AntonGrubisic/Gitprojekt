# Sätt Git hooks-sökväg
$hookPath = ".git/hooks"

# Kopiera PowerShell-skriptet till Git-hooks-mappen
Copy-Item ".githooks/pre-commit.ps1" -Destination "$hookPath/pre-commit.ps1"

# Skapa en wrapper som kör PowerShell-skriptet
@"
#!/bin/sh
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".git/hooks/pre-commit.ps1"
exit
"@ | Out-File -FilePath "$hookPath/pre-commit" -Encoding ASCII -NoNewline

Write-Host "Git hooks har installerats!" -ForegroundColor Green
