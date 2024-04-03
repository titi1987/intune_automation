# Variables
$regkey1 = "HKLM:\Software\Microsoft\Security Center\Feature"
$regkey2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"

$name = "HideFileExt"
$value = 1

# Remediation for Registry Key 1
if (!(Test-Path $regkey1)) {
    New-Item -Path $regkey1 -ErrorAction Stop
}

if (!(Get-ItemProperty -Path $regkey1 -Name $name -ErrorAction SilentlyContinue)) {
    New-ItemProperty -Path $regkey1 -Name $name -Value $value -PropertyType DWORD -ErrorAction Stop
    Write-Output "Remediation for $regkey1 complete"
}
else {
    Set-ItemProperty -Path $regkey1 -Name $name -Value $value -ErrorAction Stop
    Write-Output "Remediation for $regkey1 complete"
}

# Remediation for Registry Key 2
if (!(Test-Path $regkey2)) {
    New-Item -Path $regkey2 -ErrorAction Stop
}

if (!(Get-ItemProperty -Path $regkey2 -Name $name -ErrorAction SilentlyContinue)) {
    New-ItemProperty -Path $regkey2 -Name $name -Value $value -PropertyType DWORD -ErrorAction Stop
    Write-Output "Remediation for $regkey2 complete"
}
else {
    Set-ItemProperty -Path $regkey2 -Name $name -Value $value -ErrorAction Stop
    Write-Output "Remediation for $regkey2 complete"
}
