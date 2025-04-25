# Instalación y Solución de Error WSL2 (0x80370114)

Este repositorio contiene una guía paso a paso y dos scripts `.bat` para instalar correctamente **WSL2 (Subsistema de Windows para Linux)** en Windows 10/11 y resolver el error:

```
Installing, this may take a few minutes...
WslRegisterDistribution failed with error: 0x80370114
Error: 0x80370114
No se pudo iniciar la operación porque no se instaló una característica requerida.
```

---

## ✅ Solución paso a paso

### 1. Clonar este repositorio (o descargar los archivos)

```
git clone https://github.com/tuusuario/wsl2-installer-fix.git
```

### 2. Ejecutar el script `01-fix-wsl-error.bat`

Este script:
- Habilita las características necesarias de Windows.
- Desactiva Hyper-V si interfiere con WSL.
- Corrige el archivo `.wslconfig` si causa conflictos.

### 3. Reiniciar el equipo

> Es obligatorio para que se apliquen los cambios.

### 4. Ejecutar el script `02-install-ubuntu-wsl.bat`

Este script instala Ubuntu en WSL2 correctamente desde PowerShell.

---

## 📄 Archivos incluidos

- `01-fix-wsl-error.bat`: Repara el entorno para permitir que WSL funcione correctamente.
- `02-install-ubuntu-wsl.bat`: Instala Ubuntu sobre WSL2.

---

## 🔧 Comandos usados en los scripts

```powershell
REM Habilitar subsistema Linux y plataforma de máquina virtual
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

REM (Opcional) Desactivar Hyper-V si da conflictos
dism.exe /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart

REM Apagar WSL para reiniciar servicios
wsl --shutdown

REM Instalar Ubuntu desde PowerShell
wsl --install -d Ubuntu
```

---

## ⚠️ Requisitos previos

- Windows 10 versión 2004 o superior.
- Virtualización activada en BIOS.

---

## 👨‍💻 Autor

Marlon David Arcila Vanegas

---

### 🚀 Licencia
MIT
