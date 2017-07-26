# set-executionpolicy unrestricted -force; (new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/install.ps1','c:\install.ps1'); c:\install.ps1
# iwr == Invoke-WebRequest, iex = Invoke-Expression
# set-executionpolicy unrestricted -force; $script = iwr -URI https://github.com/jafz/boxProvisioning/raw/master/install.ps1; iex $($script.Content)

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Enable-RemoteDesktop
netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow

# delete on ondrive setup which is automatically installing itself
Reg delete HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Run\ /v OneDriveSetup /f
Reg delete HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Run\ /v OneDriveSetup /f

Import-Module $env:appdata\boxstarter\boxstarter.chocolatey\boxstarter.chocolatey.psd1

(new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/boxStarterWinUpdate.ps1','c:\boxStarterWinUpdate.ps1')
New-PackageFromScript c:\boxStarterWinUpdate.ps1 winUpdatePkg
(new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/boxStarterVs2017.ps1','c:\boxStarterVs2017.ps1')
New-PackageFromScript c:\boxStarterVs2017.ps1 vs2017Pkg
(new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/boxStarterVarious.ps1','c:\boxStarterVarious.ps1')
New-PackageFromScript c:\boxStarterVarious.ps1 variousPkg
$cred=Get-Credential
Install-BoxstarterPackage -PackageName winUpdatePkg -Credential $cred
