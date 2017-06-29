# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Basic setup
# Update-ExecutionPolicy Unrestricted # that's win2012 and so?
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-UAC


if (Test-PendingReboot) { Invoke-Reboot }

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Install Visual Studio 2013 Professional 
# cinstm visualstudio2013ultimate
# if (Test-PendingReboot) { Invoke-Reboot }

cinstm visualstudio2017enterprise
if (Test-PendingReboot) { Invoke-Reboot }
cinstm vswhere

cinstm resharper-platform
cinstm git.install
cinstm sourcetree
cinstm tortoisegit
cinstm tortoisesvn
if (Test-PendingReboot) { Invoke-Reboot }

cinstm atom
cinstm cmder
cinstm baretail

# VS extensions
# Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix
# Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
# Install-ChocolateyVsixPackage T4Toolbox http://visualstudiogallery.msdn.microsoft.com/791817a4-eb9a-4000-9c85-972cc60fd5aa/file/116854/1/T4Toolbox.12.vsix
# Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix

# AWS Toolkit is now an MSI available here http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi (no chocolatey package as of FEB 2014)
# Install-ChocolateyVsixPackage AwsToolkit http://visualstudiogallery.msdn.microsoft.com/175787af-a563-4306-957b-686b4ee9b497

#Other dev tools
cinstm fiddler4
cinstm notepadpluslus.install
cinstm beyondcompare
cinstm sysinternals
cinstm NugetPackageExplorer
cinstm windbg
# cinstm Devbox-Clink
# cinstm TortoiseHg
#cinstm VisualHG # Chocolatey package is corrupt as of Feb 2014 

#Browsers
cinstm googlechrome
cinstm firefox

#Other essential tools
cinstm 7zip
cinstm nitroreader.install
cinstm javaruntime
