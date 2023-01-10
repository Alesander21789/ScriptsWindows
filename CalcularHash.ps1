$file = "Alesander_Martínez_Seij_Práctica 2 análisis de evidencias en memoria y disco.docx"

# Cálculo del hash MD5
$md5 = New-Object System.Security.Cryptography.MD5CryptoServiceProvider
$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($file)))
Write-Output "Hash MD5: $hash"

# Cálculo del hash SHA1
$sha1 = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider
$hash = [System.BitConverter]::ToString($sha1.ComputeHash([System.IO.File]::ReadAllBytes($file)))
Write-Output "Hash SHA1: $hash"

# Cálculo del hash SHA256
$sha256 = New-Object System.Security.Cryptography.SHA256CryptoServiceProvider
$hash = [System.BitConverter]::ToString($sha256.ComputeHash([System.IO.File]::ReadAllBytes($file)))
Write-Output "Hash SHA256: $hash"

# Cálculo del hash SHA512
$sha512 = New-Object System.Security.Cryptography.SHA512CryptoServiceProvider
$hash = [System.BitConverter]::ToString($sha512.ComputeHash([System.IO.File]::ReadAllBytes($file)))
Write-Output "Hash SHA512: $hash"
