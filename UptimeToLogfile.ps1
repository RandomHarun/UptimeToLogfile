# function for formatting the time decently
function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    
}

# Settings, to be added as paramers later
$ComputerName = ""
$LogDestination = "%userprofile%\Desktop\UptimeLog-$ComputerName.txt"
$Interval = 60

# Checking if network device is reachable via ICMP Echo
$pingresult = Test-NetConnection -ComputerName $ComputerName | Select-Object PingSucceeded

# Currently, this program will run until stopped via CTRL+C or by closing the window, option to change this to be added later
while($true) {
    if ($pingresult.PingSucceeded -eq $true) {
    Write-Output "$(Get-TimeStamp) Hostname: $ComputerName Result: Ping Succeeded" | Out-File $LogDestination -Append
    }

    else {
    Write-Output "$(Get-TimeStamp) Hostname: $ComputerName Result: Ping Failed" | Out-File $LogDestination -Append
    }

    Start-Sleep -s $Interval
   }