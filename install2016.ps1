# to run, execute this in an elevated ps cmd prompt:
# set-executionpolicy unrestricted -force; (new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/install2016.ps1','c:\install2016.ps1'); c:\install2016.ps1
# iwr == Invoke-WebRequest, iex = Invoke-Expression
# set-executionpolicy unrestricted -force; $script = iwr -URI https://github.com/jafz/boxProvisioning/raw/master/install2016.ps1 -UseBasicParsing; iex $($script.Content)

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Enable-RemoteDesktop
netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow

Import-Module $env:appdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1

$cred=Get-Credential
Install-BoxstarterPackage -PackageName https://github.com/jafz/boxProvisioning/raw/master/boxPack_win2012.ps1,https://github.com/jafz/boxProvisioning/raw/master/boxStarterVs2017_enterprise.ps1,https://github.com/jafz/boxProvisioning/raw/master/boxStarterVs2015.ps1 -Credential $cred
