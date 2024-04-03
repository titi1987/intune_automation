# Variables
$regkey1 = "HKLM:\Software\Microsoft\Security Center\Feature"
$regkey2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"

$name = "HideFileExt"
$value = 1

# Check if the first registry key exists
if (!(Test-Path $regkey1)) {
    Write-Output 'RegKey 1 not available - remediate'
}
else {
    # Check the value of the registry key
    $check = (Get-ItemProperty -Path $regkey1 -Name $name -ErrorAction SilentlyContinue).$name
    if ($check -eq $value) {
        Write-Output 'Setting in RegKey 1 OK - no remediation required'
    }
    else {
        Write-Output 'Value in RegKey 1 not OK, go and remediate'
    }
}

# Check if the second registry key exists
if (!(Test-Path $regkey2)) {
    Write-Output 'RegKey 2 not available - remediate'
}
else {
    # Check the value of the registry key
    $check = (Get-ItemProperty -Path $regkey2 -Name $name -ErrorAction SilentlyContinue).$name
    if ($check -eq $value) {
        Write-Output 'Setting in RegKey 2 OK - no remediation required'
    }
    else {
        Write-Output 'Value in RegKey 2 not OK, go and remediate'
    }
}
