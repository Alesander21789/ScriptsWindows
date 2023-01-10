param(
    [string]$file
)

function CalculateHash([System.Security.Cryptography.HashAlgorithm]$hashAlgorithm, [string]$file) {
    # Open the file for reading
    $stream = [System.IO.File]::OpenRead($file)

    # Initialize the hash value
    $hashAlgorithm.Initialize()

    # Read the file in chunks and update the hash value
    $buffer = New-Object byte[] 1048576
    $read = $stream.Read($buffer, 0, 1048576)
    while ($read -gt 0) {
        $hashAlgorithm.TransformBlock($buffer, 0, $read, $buffer, 0)
        $read = $stream.Read($buffer, 0, 1048576)
    }

    # Finalize the hash value
    $hashAlgorithm.TransformFinalBlock($buffer, 0, 0)
    $hash = [System.BitConverter]::ToString($hashAlgorithm.Hash)

    # Close the stream and return the hash value
    $stream.Close()
    return $hash
}

# Calculate the hash values
$md5Hash = CalculateHash([System.Security.Cryptography.MD5CryptoServiceProvider]::new(), $file)
Write-Output "Hash MD5: $md5Hash"

$sha1Hash = CalculateHash([System.Security.Cryptography.SHA1CryptoServiceProvider]::new(), $file)
Write-Output "Hash SHA1: $sha1Hash"

$sha256Hash = CalculateHash([System.Security.Cryptography.SHA256CryptoServiceProvider]::new(), $file)
Write-Output "Hash SHA256: $sha256Hash"

$sha512Hash = CalculateHash([System.Security.Cryptography.SHA512CryptoServiceProvider]::new(), $file)
Write-Output "Hash SHA512: $sha512Hash"
