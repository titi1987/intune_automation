# Define variables
$pickliLogs = "c:\programdata\pickliLogs"
$pickliScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Path
$pickliInstallFile = "$pickliScriptRoot\7z2403-x64.msi"
$pickliArguments = "/qn /l `"$pickliLogs\Install-7z2403-x64.log`" /norestart"

# Check if log folder exists, if not, create it
if(!(Test-Path $pickliLogs))
{
    New-Item -ItemType Directory -Path $pickliLogs -Force
}

# Install 7-Zip
Start-Process -FilePath $pickliInstallFile -ArgumentList $pickliArguments -Wait
