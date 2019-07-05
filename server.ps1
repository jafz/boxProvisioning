Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC

Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

cinst baretail
cinst googlechrome
cinst notepadplusplus
