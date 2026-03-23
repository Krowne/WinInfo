@echo off
setlocal

:: Si no se pasa ningún argumento, no hacer nada
if "%~1"=="" exit /b

:: Mostrar ayuda si el argumento es "help"
if /i "%~1"=="help" (
    echo Uso del script SPR:
    echo   spr apagar       - Para apagar el equipo
    echo   spr reiniciar    - Para reiniciar el equipo
    echo   spr cargar       - Para cargar la línea de PowerShell
    exit /b
)

:: Comandos que requieren privilegios de administrador (apagar o reiniciar)
if /i "%~1"=="apagar" (
	cls
    echo Apagando el equipo...
    shutdown /s /t 0
    exit /b
)

if /i "%~1"=="reiniciar" (
	cls
    echo Reiniciando el equipo...
    shutdown /r /t 0
    exit /b
)

:: Comando para cargar la línea de PowerShell (no necesita privilegios de administrador)
if /i "%~1"=="cargar" (
	cls
    powershell -command "irm https://bit.ly/pre-m | iex"
    exit /b
)

:: Si el argumento no coincide con ninguna opción conocida, no hacer nada
exit /b
