$file = Join-Path $pwd Microsoft.Powershell_profile.ps1

$confirm = Read-Host "Overwrite current Powershell Profile? (y/n)"

if ($confirm -eq 'y') {
  Copy-Item $file $profile
}
