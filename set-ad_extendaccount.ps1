<# Used to extend accounts and set passwords in bulk 
   CSV Header: samAccountName,accountExpirationDate,accountPassword
   AccountExpirationDate in format "MM/DD/YYYY" #>


Import-Module ActiveDirectory

$Server = "DOMAINCONTROLLER.FQDN"

Import-Csv "c:\path-to-csv.csv" | foreach-object {
        
    $setpass = ConvertTo-SecureString -AsPlainText $_.accountPassword -force

    Set-ADUser -Server $Server -Identity $_.samAccountName -AccountExpirationDate $_.accountExpirationDate

    Set-ADAccountPassword -Server $Server -Identity $_.samAccountName -NewPassword $setpass

}

