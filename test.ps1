Write-Host "Script started" -ForegroundColor Green
$b64 = Get-Content "C:\Users\chloe\Desktop\payload.txt" -Raw
Write-Host "Base64 length: $($b64.Length)" -ForegroundColor Green
try {
    $shellcode = [System.Convert]::FromBase64String($b64)
    Write-Host "Decoded shellcode length: $($shellcode.Length)" -ForegroundColor Green
} catch {
    Write-Host "Error decoding Base64: $_" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}
Write-Host "Script completed – no errors" -ForegroundColor Green
Read-Host "Press Enter to exit"