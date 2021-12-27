[string] $DirPath = Get-Location
#[string] $DirPath = "$env:HOMEPATH\Desktop\AVTEST"

[string] $FilePath = "$DirPath\neweicar.com"

#Remove-Item -LiteralPath "$env:HOMEPATH\Desktop\AVTEST" -Force -Recurse -ErrorAction Ignore
#New-Item -Path "$env:HOMEPATH\Desktop\AVTEST" -ItemType directory

#Base64 of Eicar string
[string] $EncodedEicar = 'WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNULUZJTEUhJEgrSCo='

[byte[]] $EicarBytes = [System.Convert]::FromBase64String($EncodedEicar)
[string] $Eicar = [System.Text.Encoding]::UTF8.GetString($EicarBytes)
Set-Content -Value $Eicar -Encoding ascii -Path $FilePath -Force 
pause

curl -v https://secure.eicar.org/eicar.com -o $DirPath\eicar.com
curl -v https://secure.eicar.org/eicar.com.txt -o $DirPath\eicar.com.txt
curl -v https://secure.eicar.org/eicar_com.zip -o $DirPath\eicar_com.zip
curl -v https://secure.eicar.org/eicarcom2.zip -o $DirPath\eicarcom2.zip
pause

reg import .\avtest.reg
pause

[system.Diagnostics.Process]::Start("msedge","https://secure.eicar.org/eicar.com")
#[system.Diagnostics.Process]::Start("iexplore","https://secure.eicar.org/eicar.com")

[system.Diagnostics.Process]::Start("msedge","data:application/octet-stream;base64,WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNULUZJTEUhJEgrSCo=")
#[system.Diagnostics.Process]::Start("iexplore","https://secure.eicar.org/eicar.com")

pause