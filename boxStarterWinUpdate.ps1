# Basic setup
# Update-ExecutionPolicy Unrestricted # that's win2012 and so?
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC

Install-WindowsUpdate -AcceptEula