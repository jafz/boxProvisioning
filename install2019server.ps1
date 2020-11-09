# set-executionpolicy unrestricted -force; (new-object net.webclient).DownloadFile('https://github.com/jafz/boxProvisioning/raw/master/install.ps1','c:\install.ps1'); c:\install.ps1
# iwr == Invoke-WebRequest, iex = Invoke-Expression
# set-executionpolicy unrestricted -force; $script = iwr -URI https://github.com/jafz/boxProvisioning/raw/master/install.ps1; iex $($script.Content)

. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC
Set-WindowsExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions

Enable-PSRemoting -Force
cinst googlechrome -y
cinst notepadplusplus -y
cinst baretail -y
