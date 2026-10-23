# Overwritten by install.ps1
function rmdirf {
    param(
        [Parameter(Mandatory)]
        [string]$target
    )

    if (-not (Test-Path -LiteralPath $target)) {
        Write-Host "Path not found: $target" -ForegroundColor Yellow
        return
    }

    $confirm = Read-Host "Delete '$target' recursively? (y/n)"

    if ($confirm -eq 'y') {
        Remove-Item -LiteralPath $target -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Deletion completed." -ForegroundColor Green
    }
}

function elevate {
    Start-Process pwsh -Verb RunAs
    exit
}


$name = gh api user --jq .login

Write-Host ""
Write-Host "  ╭─ GitHub ──────────────────" -ForegroundColor DarkCyan
Write-Host "  │  User: " -NoNewline -ForegroundColor DarkGray
Write-Host "$name" -ForegroundColor Cyan
Write-Host "  ╰───────────────────────────" -ForegroundColor DarkCyan
Write-Host ""

$ompexists = Get-Command oh-my-posh -ErrorAction SilentlyContinue

if ($ompexists) {
   oh-my-posh init pwsh --config 'C:\Users\eliji\AppData\Local\omp-manager\themes\zash.omp.json' | Invoke-Expression  # [omp-manager]
}
