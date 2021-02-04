# git / github / github cli
choco install -y git.install --params='/GitAndUnixToolsOnPath /WindowsTerminal /SChannel' 
choco install -y github-desktop
choco install -y gh

# tools we expect devs across many scenarios will want
choco install -y microsoft-windows-terminal
choco install -y vscode
choco install -y atom
choco install -y notepadplusplus.install
choco install -y 7zip.install
choco install -y sysinternals
choco install -y jq
choco install -y curl
choco install -y windows-sdk-10-version-2004-windbg

# python 3 and pip
choco install -y python

# visual studio redist (2015-2019)
choco install -y vcredist140

# node.js + yarn
choco install -y nodejs-lts
choco install -y yarn

# golang
choco install -y golang

# docker
choco install -y docker-desktop

# aws
choco install -y awscli

# misc tools
choco install -y googlechrome
choco install -y firefox
choco install -y dropbox
choco install -y slack
choco install -y 1password
choco install -y 1password-cli
choco install -y zerotier-one

# refresh path / env
refreshenv

# update pip
python -m pip install --upgrade pip

# enable virtual machine / hyper-v / wsl
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# install wsl
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile WSLUpdate.msi -UseBasicParsing
msiexec.exe /package WSLUpdate.msi /quiet
wsl --set-default-version 2

# install ubuntu
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx

# powershell 7
Invoke-WebRequest -Uri https://github.com/PowerShell/PowerShell/releases/download/v7.0.4/PowerShell-7.0.4-win-x64.msi -OutFile PowerShell.msi -UseBasicParsing
msiexec.exe /package PowerShell.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1

# scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# winget
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v-0.2.10191-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -OutFile Winget.appx -UseBasicParsing
Add-AppxPackage .\Winget.appx
