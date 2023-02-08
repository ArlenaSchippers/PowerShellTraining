

###Opdracht 1###



'Geef een local user op '

$UserName = Read-Host

$UserObject = Get-LocalUser -Name $UserName


if($UserObject.Description -eq 'sales')
{
    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'support'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }
}

elseif($UserObject.Description -eq 'support')
{


    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'sales'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }


}
else 
{

    "Waar wil je de beschrijving in veranderen"
    $beschrijving = read-host
    Set-LocalUser -Name $UserObject.Name -Description $beschrijving

}

Get-LocalUser -Name $UserObject.Name

###Opdracht 2###



'Geef een local user op '

$UserName = Read-Host

$UserObject = Get-LocalUser -Name $UserName


if($UserObject.Description -eq 'sales')
{
    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'support'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }
}

elseif($UserObject.Description -eq 'support')
{


    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'sales'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }


}
else 
{

    "Waar wil je de beschrijving in veranderen"
    $beschrijving = read-host

    "Weet je zeker dat je de beschrijving wilt veranderen? (j/n)"
    $Antwoord = read-host
}
    if($Antwoord -eq "j")
    {
        Set-LocalUser -Name $UserObject.Name -Description $beschrijving
        Get-LocalUser -Name $UserObject.Name
    }
    if($Antwoord -eq "n")
    {
        "OK, dan verander je het niet"
    }

###Opdracht 3###

"Welke gebruiker wil je aanmaken in Active Directory?"
$Gebruiker = read-host 

"Welk wachtwoord wil je gebruiken?"
$Wachtwoord = ConvertTo-SecureString "Pa55.wrd" -AsPlainText -Force

New-ADUser -Name $Gebruiker -Enabled $true -AccountPassword (read-host -AsSecureString $Wachtwoord)
Get-ADUser -Identity $Gebruiker


###Opdracht 4### (##hier morgenochtend nog even naar kijken?)


"Welke gebruiker wil je aanmaken in Active Directory?"
$Gebruiker = read-host 

"Welk wachtwoord wil je gebruiken?"
$Wachtwoord = ConvertTo-SecureString "Pa55.wrd" -AsPlainText -Force

"Welke OU?"
$OU = Read-Host

New-ADOrganizationalUnit -Name $OU
$Path = "OU="+$OU +",DC=adatum, DC=COM"

New-ADUser -Name $Gebruiker -Enabled $true -AccountPassword (read-host -AsSecureString $Wachtwoord) -Path $Path
Get-ADUser -Identity $Gebruiker

###Opdracht 5###
    
"Welke gebruiker wil je aanmaken in Active Directory?"
$Gebruiker = read-host 

"Welk wachtwoord wil je gebruiken?"
$Wachtwoord = ConvertTo-SecureString "Pa55.wrd" -AsPlainText -Force

"Welke OU?"
$OU = Read-Host

New-ADOrganizationalUnit -Name $OU
$Path = "OU="+$OU +",DC=adatum, DC=COM"

"Weet je zeker dat je de gebruiker wilt aanmaken (j/n)?"
$answer = read-host 

if ($answer -eq "j") 
{
New-ADUser -Name $Gebruiker -Enabled $true -AccountPassword (read-host -AsSecureString $Wachtwoord) -Path $Path
Get-ADUser -Identity $Gebruiker
}

if ($answer -eq "n") 
{
  "sorry, dan nemen we hier afscheid"
}

###Opdracht 6###
"Welk wachtwoord wil je gebruiken?"
$Wachtwoord = ConvertTo-SecureString "Pa55.wrd" -AsPlainText -Force

New-ADOrganizationalUnit -Name "LOTR"
Get-ADOrganizationalUnit -Filter *
$Path = "OU="+"LOTR" +",DC=adatum, DC=COM"

New-ADUser -Name "Frodo" -Enabled $true -AccountPassword (read-host -AsSecureString $Wachtwoord) -Path $Path -Description "LOTR" 
New-ADUser -Name "Sauron" -Enabled $true -AccountPassword (read-host -AsSecureString $Wachtwoord) -Path $Path -Description "LOTR" 
Get-ADUser -Filter *


###Opdracht 6 aanvulling###

"Welk wachtwoord wil je gebruiken?"
$Wachtwoord = ConvertTo-SecureString "Pa55.wrd" -AsPlainText -Force

"Naar welk OU wil je verhuizen?"
$OU = read-host 
New-ADOrganizationalUnit -Name $OU
$Path = "OU="+$OU +",DC=adatum, DC=COM"

get-aduser -Filter * -Properties *|Where-Object {$_.description -eq "LOTR"}|Move-ADObject -TargetPath $Path


