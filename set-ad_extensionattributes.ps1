<# Target Identity (samAccountName in this case) and update the msDS extension attributes of an
   Active Directory user object. CSV Format as follows: samAccount,attribute11,attribute12,attribute13 #>

Import-Module ActiveDirectory
    
    $Server = "DOMAINCONTROLLER.FQDN"

    Import-Csv "c:\path-to-csv.csv" | foreach-object {

        Set-ADUser -Server $Server -Identity $_.samAccount -Add @{"msDS-cloudExtensionAttribute11"=$_.attribute11; `
        "msDS-cloudExtensionAttribute12"=$_.attribute12;"msDS-cloudExtensionAttribute13"=$_.attribute13}
    
    }

