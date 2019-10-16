# git
choco install git.install --params='/GitAndUnixToolsOnPath /WindowsTerminal /SChannel' -y

# tools we expect devs across many scenarios will want
choco install -y atom
choco install -y vscode
choco install -y notepadplusplus.install
choco install -y 7zip.install
choco install -y sysinternals
choco install -y github-desktop

# terminals
choco install -y cmdermini
choco install -y terminus

# python 3 and pip
choco install -y python

# Refresh path
refreshenv

# Update pip
python -m pip install --upgrade pip

# Get Visual Studio C++ Redistributables
choco install -y vcredist2015
choco install -y vcredist2017

# vscode extensions
code --install-extension msjsdiag.debugger-for-chrome

# node.js
choco install -y nodejs-lts

# fonts
choco install -y firacode