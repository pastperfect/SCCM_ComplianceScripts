$IP = Get-NetIPAddress -AddressFamily IPv4 | Where IPAddress -like "192.168.*"

foreach ($I in $ip) {

# Change this to a switch.
if ($I -like "192.168.2.*") { Write-Host "Aberdeen"}

}