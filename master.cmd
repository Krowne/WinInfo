@echo off
setlocal enabledelayedexpansion
set "pathd=%cd%"
set "dirs=3D Objects,Contacts,Desktop,Documents,Downloads,Favorites,Links,Music,OneDrive,Pictures,Saved Games,Searches,Videos"

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

    rem Lista de directorios a copiar
    
    rem Mostrar los directorios que se copiar n
    echo Directories to copy: %dirs%

    rem Verificar si la ruta de destino existe
    if not exist "%destination%" (
        echo La ruta de destino no existe. Creando directorios necesarios...
        mkdir "%destination%"
        if errorlevel 1 (
            echo Error al crear el directorio. Aseg£rese de que tiene permisos.
            goto :eof
        )
    )

    rem Copiar cada directorio especificado
    for %%D in (%dirs%) do (
        echo Copiando %%D...
        rem Usar robocopy para copiar el contenido, ignorando v¡nculos
        robocopy "%pathd%\%%D" "%destination%\%%D" /MIR /R:0 /W:0 /XJ
        
        rem Verificar si la copia fue exitosa
        if errorlevel 1 (
            echo Algunos archivos en %%D no se copiaron debido a restricciones.
        )
    )
) else if /i "%command%"=="help" (
cls
    echo.
    echo [93m   Comandos disponibles:[37m
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
    goto :eof
) else (
    echo Error: Comando no reconocido.
)
endlocal
