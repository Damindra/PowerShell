# Ping a website and return the round trip time in milliseconds using the Test-NetConnection cmdlet

param(
    [string[]]$Websites
)

if (-not $Websites) { 
    Write-Host "Please provide one or more websites or hostnames separated by spaces or commas using the `-Websites` parameter." -ForegroundColor Yellow 
    exit
}

function Test-Websites {
    param (
        [string[]]$Websites
    )

    $Websites = $Websites -split ",| "


    foreach ($Website in $Websites) { 
        Write-Host "Testing $Website ..." 
        
        $testNetConnection = Test-NetConnection -ComputerName $Website -InformationLevel Detailed 
            
        
        $pingDetails = $testNetConnection.PingReplyDetails | Select-Object Address, RoundTripTime 
        write-host $Website
        write-host $pingDetails
        } 
    }    


# Call the function with provided websites
Test-Websites -Websites $websites