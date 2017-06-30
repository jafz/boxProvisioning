
Write-Host "Here are the top 10 CPU consuming processes right now"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
