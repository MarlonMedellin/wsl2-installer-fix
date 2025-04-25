@echo off
echo =============================================
echo Corrigiendo entorno para habilitar WSL2...
echo =============================================

REM Crear carpeta temporal si no existe
if not exist C:\temp (
    mkdir C:\temp
)

REM Habilitar características necesarias
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

REM (Opcional) Desactivar Hyper-V
dism.exe /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart

REM Eliminar configuración conflictiva si existe
del "%USERPROFILE%\.wslconfig" /f >nul 2>&1

echo Apagando servicios WSL...
wsl --shutdown

echo Operación completada. Por favor reinicia el equipo.
pause
