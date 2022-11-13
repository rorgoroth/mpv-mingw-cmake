# 7z
$7zexe = [Environment]::ExpandEnvironmentVariables("%Programfiles%\7-Zip\7z.exe")

# Extracting
function Extract-Archive {
    Write-Host "Extracting" $file -ForegroundColor Green
    & $7zexe x -y $file
}

# Download, extract and remove
function Update-Xonotic {
    $link = "https://github.com/rorgoroth/mingw-cmake-env/releases/download/latest/xonotic.7z"
    $file = "xonotic.7z"
    Write-Host "Downloading" $file -ForegroundColor Green
    Invoke-WebRequest -Uri $link -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox -OutFile $file
    Extract-Archive
    Remove-Item -Force $file
}

# Run the whole lot here
try {
    Update-Xonotic
    Write-Host "Operation completed" -ForegroundColor Magenta
}
catch [System.Exception] {
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}