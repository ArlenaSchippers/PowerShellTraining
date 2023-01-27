#$Name = 'Arlena'

#'Hallo' + $Name 

######
#"Geef je naam op alsjeblieft"

#$Name = Read-Host 

#"Hallo" + " $Name"

######
#"Geef je naam op alsjeblieft"

#$Name = Read-Host 

#Get-Service -Name $Name

#Opdracht 1 
"PowerShell Rocks!"

#Opdracht 2 
"Wat wil je laten weergeven op het scherm?" 
$Name = Read-Host 
$Name

#Opdracht 3 
"Welke Gebruiker?"
$User = Read-Host 
Get-LocalUser -Name $User

#of 
"Welke Gebruiker?"
$User = Read-Host 
Get-LocalUser |Where-Object($psitem.name -eq $user) 


#Opdracht 4
$name = "spooler"
$status = "running"

set-service -name $name -status $status
"Welke Service stoppen?"
$Service = Read-Host
get-service|where-object{$psitem.name -eq $service}|stop-service
get-service -name $service
"welke service:" + " $service"


#Opdracht 2.1 
"Wie ben je"
$naam = read-host 

if($naam -eq "Arlena")
{ 
    "Welkom " + $naam
}
else
{
    "Ik ken je niet " + $naam
}

#Opdracht 2.2 

"Wie ben je"
$naam = read-host 

if($naam -eq "Arlena")
{ 
    "Welkom " + $naam
}
elseif($naam -eq "Piet")
{ 
    "Je dient je te melden bij de directie " + $naam + "!"
}
else
{
    "Ik ken je niet " + $naam
}

#maak een echte user in AD, als user bestaat dan doe je user bestaat wel en anders niet 
$password = ConvertTo-SecureString "Pa55w.rd" -AsPlainText -Force
New-ADUser -Name "Leentje" -Enabled $True -accountpassword $password
$GetADUser = Get-ADUser -Filter * 
$GetADUser.Name 
"Welke user wil je opgeven?"
$ADUser = read-host 

if($GetADUser.Name -eq  $ADUser)
{ 
    "AD User " + $ADUser + " bestaat wel"
} 
else
{
    "AD User bestaat niet"
}

##uitproberen variabelen 
$name = read-host 
$getservice = get-service -name "SysMain"
$Getservice.Status
$Getservice.Name

#Opdracht 3.1 
"Geef de servicenaam op en dan ga ik hem stoppen of starten"

$ServiceNaam = "spooler" 
$ServiceObject = Get-service -Name "spooler"

If($ServiceObject.Status -eq "running") 
{ 
    "De service" + $ServiceNaam + "heeft status " + $ServiceObject.status + " en wordt gestopt"
     stop-service -name $ServiceNaam
}
elseif($ServiceObject.Status -eq "stopped") 
{    
   "De service" + $ServiceNaam + "heeft status " + $ServiceObject.status + " en wordt gestart"
     start-service -name $ServiceNaam
}
Get-service -Name $ServiceNaam 

#Opdracht 3.2 
"Van welke service wil je de status zien?"
$ServiceNaam = read-host 
$ServiceObject = Get-service -Name $ServiceNaam

If($ServiceObject.Status -eq "running") 
{ 
    "De service" + $ServiceNaam + "heeft status " + $ServiceObject.status + " en wordt gestopt"
     stop-service -name $ServiceNaam
}
elseif($ServiceObject.Status -eq "stopped") 
{    
   "De service" + $ServiceNaam + "heeft status " + $ServiceObject.status + " en wordt gestart"
     start-service -name $ServiceNaam
}
Get-service -Name $ServiceNaam 

#Opdracht 3.3 
#New-LocalUser -Name "Arlena1" -description "Sales" -NoPassword
#New-LocalUser -Name "Arlena2" -description "Sales" -NoPassword
#New-LocalUser -Name "Arlena3" -description "Support" -NoPassword
#New-LocalUser -Name "Arlena4" -description "Support" -NoPassword


$GetLocalUser = Get-LocalUser|Where-Object {$_.name -eq "Arlena1" -or $_.name -eq "Arlena2" -or $_.name -eq "Arlena3" -or $_.name -eq "Arlena4"}

"Geef naam op"
$UserName = read-host

If ($GetLocalUser.description -eq "Sales")
{
    "Omschrijving is Sales en wordt veranderd in Support voor " + $UserName
    Set-LocalUser -name $UserName -description "Support"
}
elseif ($GetLocalUser.description -eq "Support")
{
    "Omschrijving is Support en wordt veranderd in Sales voor " + $UserName
    Set-LocalUser -name $UserName -description "Sales"
}
Get-LocalUser -Name $GetLocalUser


#Opdracht 3.3 extra 

#New-LocalUser -Name "Arlena1" -description "Sales" -Enabled $true
#New-LocalUser -Name "Arlena2" -description "Sales" -Enabled $true
#New-LocalUser -Name "Arlena3" -description "Support" -Enabled $true
#New-LocalUser -Name "Arlena4" -description "Support" -Enabled $true

"Wil je het script runnen (antwoord met j of n)?"

$ScriptrunnenJofN = read-host 
if ($ScriptrunnenJofN -eq "j")
{

$GetLocalUser = Get-LocalUser|Where-Object {$_.name -eq "Arlena1" -or $_.name -eq "Arlena2" -or $_.name -eq "Arlena3" -or $_.name -eq "Arlena4"}

"Geef naam op"
$UserName = read-host



If ($GetLocalUser.description -eq "Sales")
{
    "Omschrijving is Sales en wordt veranderd in Support voor " + $UserName
    Set-LocalUser -name $UserName -description "Support"
}
elseif ($GetLocalUser.description -eq "Support")
{
    "Omschrijving is Support en wordt veranderd in Sales voor " + $UserName
    Set-LocalUser -name $UserName -description "Sales"
}
}
elseif ($ScriptrunnenJofN -eq "n") 
{ 
    "script niet gerund, want antwoord is nee"
}

##Opdracht 3.3 extra voor local users 

$Password = ConvertTo-SecureString "Hallo#123" -AsPlainText -Force 
New-ADUser -Name "Arlena1" -description "Sales" -Enabled $true -accountpassword $Password
New-ADUser -Name "Arlena2" -description "Sales" -Enabled $true -accountpassword $Password
New-ADUser -Name "Arlena3" -description "Support" -Enabled $true -accountpassword $Password
New-ADUser -Name "Arlena4" -description "Support" -Enabled $true -accountpassword $Password

"Wil je het script runnen (antwoord met j of n)?"

$ScriptrunnenJofN = read-host 
If ($ScriptrunnenJofN -eq "j")
{
    "Geef naam op"
    $GetADUser = Get-ADUser -Filter *|Where-Object {$_.identity -eq "Arlena1" -or $_.identity -eq "Arlena2" -or $_.identity -eq "Arlena3" -or $_.identity -eq "Arlena4"}
    $UserName = read-host
    Get-ADUser -Filter *

    
    If ($GetADUser.description -eq "Sales")
        {
            "Hey, wil jij de user echt aanpassen? (j/n)"
            $vraag = read-host 
            if($vraag -eq "j") 
            {
            "Omschrijving is Sales en wordt veranderd in Support voor " + $UserName
            Set-LocalUser -name $UserName -description "Support"
            }
            else 
            {
            "Ok, dan niet"
            }
        }

    Elseif ($GetADUser.description -eq "Support")
        {
            "Hey, wil je deze user echt wijzigen? (j/n)"
            $vraag2 = read-host 
            if($vraag2 -eq "j") 
            {
            "Omschrijving is Support en wordt veranderd in Sales voor " + $UserName
            Set-LocalUser -name $UserName -description "Sales"
            } 
            else 
            { 
            "Ok, laat dan maar zitten"
            }
        }
}

Elseif ($ScriptrunnenJofN -eq "n") 
{ 
    "script niet gerund, want antwoord is nee"
}

