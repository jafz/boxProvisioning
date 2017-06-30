
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Enable-RemoteDesktop
netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow

Import-Module $env:appdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1

#(new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/boxPack.ps1','c:\boxPack.ps1')
$cred=Get-Credential
Install-BoxstarterPackage -PackageName https://github.com/jafz/boxProvisioning/raw/master/boxPack.ps1 -Credential $cred
