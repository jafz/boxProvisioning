# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Basic setup
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-BingSearch
Disable-UAC

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

cinst baretail

cinst notepadplusplus.install
cinst notepad2
cinst googlechrome

cinst 7zip
