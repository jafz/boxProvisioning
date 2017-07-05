# to run, execute this in an elevated ps cmd prompt:
# set-executionpolicy unrestricted -force; (new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/install2012.ps1','c:\install2012.ps1'); c:\install.ps1
# iwr == Invoke-WebRequest, iex = Invoke-Expression
# set-executionpolicy unrestricted -force; $script = iwr https://github.com/jafz/boxProvisioning/raw/master/install2012.ps1 ; iex $($script.Content)

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Enable-RemoteDesktop
netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow

Import-Module $env:appdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1

$cred=Get-Credential
Install-BoxstarterPackage -PackageName https://github.com/jafz/boxProvisioning/raw/master/boxPack_win2012.ps1 -Credential $cred
