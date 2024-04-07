$configContent = @"
[Interface]
PrivateKey = CFvbpmDQicTYGgNDYmoUEwwnzo0HK+q7fHeFz8G/WlY=
ListenPort = 51820
Address = 10.200.254.11/32
DNS = 1.1.1.1
[Peer]
PublicKey = bgs+vDyZEBRZ1a2MtjqvVthFJ3H40LiLk1PZoviIOnE=
AllowedIPs = 10.200.0.0/16
Endpoint = 81.96.238.19:51820
"@

# Define the path where the configuration file will be saved
# Ensure you replace 'your-config-name' with an appropriate file name and extension
$configFilePath = "C:\Program Files\WireGuard\Data\Configurations\wireguard_client01.conf"

# Check if the WireGuard Configurations folder exists, if not create it
$dirPath = "C:\Program Files\WireGuard\Data\Configurations"
If (-Not (Test-Path $dirPath)) {
    New-Item -ItemType Directory -Force -Path $dirPath
}

# Write the configuration to the file
$configContent | Out-File -FilePath $configFilePath -Encoding ascii

# Optional: Set permissions on the configuration file if needed
# This step may require additional consideration depending on your security requirements

Write-Host "Configuration file deployed successfully to $configFilePath"
