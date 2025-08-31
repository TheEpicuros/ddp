function Test-GitClean {
param([switch]$VerboseOut)
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { Write-Error "git not found in PATH"; return $false }
$status = git status --porcelain
if ($VerboseOut) { Write-Host "== git porcelain =="; $status }
return [string]::IsNullOrWhiteSpace($status)
}
function New-BackupBranch {
param([string]$Base="backup/main-diverged")
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$name = "$Base-$stamp"
git branch $name 2>$null
if ($LASTEXITCODE -ne 0) {
Write-Host "# Could not create $name (maybe it already exists?)." -ForegroundColor Yellow
return $false
}
Write-Host "# Created $name"
return $true
}
function Get-GitCurrentBranch {
(git branch --show-current).Trim()
}
