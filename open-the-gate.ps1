# Init Variables
$wsl_ip = (wsl hostname -I).trim()
$fwRuleName="Allow WSL Ports"
$portArray = 1234, 8000, 8080, 9000, 9001, 9002
Write-Host "WSL Machine IP: $wsl_ip"

# Applying forwarding rules
foreach($port in $portArray){
    Write-Host "Forwarding Port: $port to WSL"
    netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$wsl_ip
}

# Applying FW rules
if (Get-NetFirewallRule -DisplayName $fwRuleName) {
    Write-Host "Firewall rule already exist, re-applying the rule to keep it updated"
    Remove-NetFirewallRule -DisplayName  $fwRuleName
} else {
    Write-Host "Firewall rule not applyed yet"
}
New-NetFirewallRule -DisplayName $fwRuleName -Direction Inbound -Action Allow -LocalPort $portArray -Protocol TCP
