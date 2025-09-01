$IsAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

if (-not $IsAdmin) {
    Write-Host "Reiniciando como administrador..."
    $urlgit = 'https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m'
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"irm $urlgit | iex`"" -Verb RunAs
    exit
}

$host.UI.RawUI.WindowTitle = "Menú de Configuración del Sistema"
$urlgit = 'https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m'
Write-Host "Cargando configuración.."
Invoke-RestMethod $urlgit | Invoke-Expression
