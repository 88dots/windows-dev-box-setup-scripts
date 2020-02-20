# Description: Aperion Development Tools
# Author: Counterplay Games

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

executeScript "DevTools.ps1";

#---  vs 2017 with desktop development workload ---
# choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
# Update-SessionEnvironment #refreshing env due to Git install
# choco install -y visualstudio2017-workload-nativedesktop

#---  vs 2019 with desktop development and gaming workload ---
choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install
choco install -y visualstudio2019-workload-nativedesktop
choco install -y visualstudio2019-workload-nativegame

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
