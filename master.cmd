@echo off
setlocal enabledelayedexpansion

set "pathd=%cd%"
set "dirs=3D Objects;Contacts;Desktop;Documents;Downloads;Favorites;Links;Music;OneDrive;Pictures;Saved Games;Searches;Videos"

rem Inicializa el tamaño total
set "totalSize=0"

rem Verificar si hay suficientes argumentos
if "%~1"=="" (
    echo Error: No se ha especificado un comando.
    goto :eof
)

rem Asignar argumentos a variables
set "command=%~1"
set "destination=%~2"

rem Comando cp para copiar archivos
if /i "%command%"=="cp" (
    if "%destination%"=="" (
        echo Error: No se ha especificado una ruta de destino.
        goto :eof
    )

    rem Verificar si la ruta de destino existe
    if not exist "%destination%" (
        echo La ruta de destino no existe. Creando directorios necesarios...
        mkdir "%destination%"
        if errorlevel 1 (
            echo Error al crear el directorio. Aseg£rese de que tiene permisos.
            goto :eof
        )
    )

    rem Copiar todo el contenido al destino con robocopy, ignorando archivos bloqueados y sin seguir v¡nculos
    echo Copiando archivos y carpetas al destino, ignorando archivos bloqueados y v¡nculos...
    robocopy . "%destination%" /MIR /R:0 /W:0 /XJ
    if errorlevel 1 (
        echo Algunos archivos no se copiaron debido a restricciones, pero la copia ha continuado.
    ) else (
        echo Copia completada con ‚xito.
    )

rem Comando dir para listar archivos y carpetas ocultas
) else if /i "%command%"=="dir" (
    echo Listando archivos y carpetas, incluyendo los ocultos:
    dir /a

rem Comando del para borrar todo el contenido del directorio actual y luego el directorio en s¡
) else if /i "%command%"=="del" (
    echo El directorio actual es: %pathd%
    echo Advertencia: Esto borrar  todos los archivos y subcarpetas del directorio actual, incluyendo el propio directorio.
    set /p "confirm=¿Desea continuar? (S/N): "
    if /i "!confirm!" NEQ "S" (
        echo Operaci¢n cancelada por el usuario.
        goto :eof
    )

    rem Cambiar al directorio padre
    cd ..

    rem Borrar el directorio capturado y su contenido
    echo Borrando contenido del directorio "%pathd%"...
    rd /s /q "%pathd%"
    if errorlevel 1 (
        echo Error al intentar borrar el directorio "%pathd%".
    ) else (
        echo Todo el contenido y el directorio se han borrado correctamente.
    )

rem Comando cpall para copiar directorios espec¡ficos
) else if /i "%command%"=="cpall" (
    if "%destination%"=="" (
        echo Error: No se ha especificado una ruta de destino.
        goto :eof
    )
if not exist "%destination%" (
    echo La ruta de destino no existe. Creando directorios necesarios...
    mkdir "%destination%"
    if errorlevel 1 (
        echo Error al crear el directorio. Asegúrese de que tiene permisos.
        goto :eof
    )
)
echo.
echo Copiando listado de directorios de usuario:
rem Copiar cada directorio especificado
for %%D in ("%dirs:;=" "%") do (
    echo Copiando:[92m %%~D [37m
    rem Usar robocopy para copiar el contenido, ignorando vínculos, y redirigir la salida a nul
    robocopy "%pathd%\%%~D" "%destination%\%%~D" /MIR /R:0 /W:0 /XJ /NFL /NDL /NJH /NJS /NC /NS /NP >nul
    
    rem Verificar si la copia fue exitosa y mostrar el resumen
    rem if not errorlevel 1 (
    rem    echo Copia completada para %%D.
    rem )
)
) else if /i "%command%"=="help" (
cls
    echo.
    echo [93m   Comandos disponibles:[37m
    echo.
    echo [92m   grant        [37m     - Cambiar los permisos del directorio actual y todos sus directorios y archivos recursivamente a [92mTodos[37m
    echo                        [93mEjemplo: [92mmaster grant
    echo.
    echo [92m   grant destino[37m     - Cambiar los permisos del directorio destino y todos sus directorios y archivos recursivamente a [92mTodos[37m
    echo                        [93mEjemplo: [92mmaster grant "D:\Temporal"[37m
    echo.
    echo [92m   size      [37m        - Muestra el tama¤o del contenido del directorio actual.
    echo                        [93mEjemplo: [92mmaster size[37m
    echo.
    echo [92m   sizeuser  [37m        - Muestra el tama¤o del contenido de los directorios del usuario.
    echo                        [93mEjemplo: [92mmaster sizeuser[37m
    echo.
    echo [92m   cp destino[37m        - Copia todos los archivos y carpetas del directorio actual a la ruta especificada.
    echo                        [93mEjemplo: [92mmaster cp "D:\Temporal"[37m
    echo.
    echo [92m   cpall destino[37m     - Copia directorios espec¡ficos del usuario ^(3D Objects, Documents, etc.^) a la ruta especificada.
    echo                        [93mEjemplo: [92mmaster cpall "D:\Temporal"[37m
    echo.
    echo [92m   dir[37m               - Lista archivos y carpetas en el directorio actual, incluyendo archivos ocultos.
    echo                        [93mEjemplo: [92mmaster dir[37m
    echo.
    echo [92m   del[37m               - Borra todo el contenido del directorio actual y el propio directorio.
    echo                        Advertencia: Esta acci¢n es irreversible.
    echo                        [93mEjemplo: [92mmaster del[37m
	echo.
    goto :eof
) else if /i "%command%"=="sizeuser" (
echo.
	echo Obteniendo el tama¤o total de los directorios del usuario..
	powershell -Command "$dirs='3D Objects;Contacts;Desktop;Documents;Downloads;Favorites;Links;Music;OneDrive;Pictures;Saved Games;Searches;Videos'; $totalBytes=0; $dirs.Split(';') | ForEach-Object { $size = (Get-ChildItem -Path $_ -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { -not ($_.PSIsContainer -or $_.Attributes -match 'ReparsePoint') } | Measure-Object -Property Length -Sum).Sum; if (-not $size) { $size = 0 } ; Write-Host ($_ + ': ') -NoNewline; Write-Host ('{0} bytes' -f $size) -ForegroundColor Green; $totalBytes += $size }; Write-Host ('Tama¤o total de bytes de todos los directorios: ') -NoNewline; Write-Host ('{0} bytes' -f $totalBytes) -ForegroundColor Green"
) else if /i "%command%"=="size" (
	cd..
	echo.
	echo Obteniendo el tama¤o total de %pathd%..
	powershell -Command "(Get-ChildItem -Path '%pathd%' -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { -not ($_.Attributes -match 'ReparsePoint') } | Measure-Object -Property Length -Sum) | ForEach-Object { Write-Host ('El tama¤o total es: ') -NoNewline; Write-Host ('{0} bytes' -f $_.Sum) -ForegroundColor Green }"

	cd %pathd%
) else if /i "%command%"=="grant" (
	if exist "%destination%" (
        echo La ruta es "%destination%"
		powershell -Command "Write-Host ''; Write-Host 'Cambiando propietario y permisos de %destination%...'; takeown /f %destination% /r /d s >$null 2>&1; icacls %destination% /setowner 'Todos' /t /q /c >$null 2>&1; icacls %destination% /grant 'Todos:(F)' /t /q /c /inheritance:e >$null 2>&1"
    ) else (
	    powershell -Command "cd ..; Write-Host ''; Write-Host 'Cambiando propietario y permisos de %pathd%...'; takeown /f %pathd% /r /d s >$null 2>&1; icacls %pathd% /setowner 'Todos' /t /q /c >$null 2>&1; icacls %pathd% /grant 'Todos:(F)' /t /q /c /inheritance:e >$null 2>&1; cd %pathd%"
	)
) else (
    echo Error: Comando no reconocido.
)
endlocal
