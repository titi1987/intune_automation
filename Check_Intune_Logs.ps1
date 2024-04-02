# Define the log file path
$logFilePath = "D:\INTUNE\IntuneManagementExtension.log"

# Define the output CSV file path
$outputCsvPath = "C:\global\IntuneErrors.csv"

# Search for "error code" and export to CSV
Select-String -Path $logFilePath -Pattern "error code" -CaseSensitive:$false |
    Select-Object LineNumber, Line |
    Export-Csv -Path $outputCsvPath -NoTypeInformation -Force

Write-Host "Operation completed. Check '$outputCsvPath' for results."
