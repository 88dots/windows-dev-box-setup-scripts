# fonts
choco install -y firacode
choco install -y inconsolata 

# tools we expect devs across many scenarios will want
choco install -y atom
choco install -y vscode
choco install -y notepadplusplus.install
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y 7zip.install
choco install -y sysinternals

# terminals
choco install -y cmdermini
choco install -y terminus

# team tools
choco install -y dropbox
choco install -y slack
choco install -y 1password

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