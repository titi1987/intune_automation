if(test-path -Path "C:\Program Files\Zoom\bin\Zoom.exe")
{
    check Firefox installed version
    if((Get-Item -Path "C:\Program Files\Zoom\bin\Zoom.exe").VersionInfo.FileVersion -lt 5,17,5,31030)
    {
        Write-Output "OLD: Firefox is older than version 5,17,5,31030"
        exit 1
    }
    else
    {
        Write-Output "Zoom is up to date version"
        exit 0
    }
}
else
{
    Write-Output "Zoom not installed"
    exit 0
}