# Dev Box Setup
A one-click streamlined process to setup your development machine. 

These scripts leverage two popular open source projects.
- Boxstarter [boxstarter.org](http://boxstarter.org)
- Chocolatey [chocolatey.org](http://chocolatey.org)

Boxstarter is a wrapper for Chocolatey and includes features like managing reboots for you. We're using the Boxstarter web launcher to start the installation process:<br/>
https://boxstarter.org/Learn/WebLauncher

## How to run the scripts
To run a recipe script, click a link in the table below from your target machine. This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then leave the job unattended and come back when it's finished. It is recommended to run these scripts on freshly installed instances of Windows.

|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/88dots/windows-dev-box-setup-scripts/master/cpg-tools.ps1'>Team Tools</a>     | `CPG` Common Team Tools |
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/88dots/windows-dev-box-setup-scripts/master/vs-build.ps1'>VS Build Tools</a>     | `Aperion` Development Tools |
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/88dots/windows-dev-box-setup-scripts/master/windows-common.ps1'>Windows Setup</a>     | Optionally configure Windows with common defaults |

## What's Installed
### `CPG` Common Tools
- Dropbox
- Slack
- Firefox
- Chrome

### `Aperion` Development Tools
- Git
- Visual Studio 2017 + required workloads
- Visual Studio 2019 + required workloads
- Visual Studio Code
- Github Desktop
- Python 3 + npm
- Nodejs LTS + npm
- Atom
- Notepad++
- 7Zip
- Windows Sysinternals
- Cmder Mini
- Terminus
- Visual Studio Redistributables (vcredist 2015/2017)

### `Aperion` Ops Tools
- Enables Windows Hyper-V
- Enables Windows Subsystem for Linux with Ubuntu 18.04
- Docker
- Terraform
- AWS CLI
- AWS Vault
- Packer

**Notes:**  
1. If you are using WSL there's a followup step we recommend after running the setup script.  When the script finishes you will only have a root user with a blank password. You should  manually create a non-root user via `$ sudo adduser [USERNAME] sudo` 
with a non-blank password. Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).

## Project structure
The script code is organized in a hierarchy

**Recipes**
A recipe is the script you run.  It calls multiple helper scripts.  These currently live in the root of the project (dev_app.ps1, dev_webnodejs.ps1, etc.) 

**Helper Scripts**: A helper script performs setup routines that may be useful by many recipes. Recipes call helper scripts (you don't run helper scripts directly).  The helper scripts live in the **scripts** folder

## Known issues
- The Boxstarter ClickOnce installer does not work when using Chrome.  This issue is being tracked [here](https://github.com/chocolatey/boxstarter/issues/345). Please use Edge to run the ClickOnce installer.
- Reboot is not always logging you back in to resume the script.  This is being tracked [here](https://github.com/chocolatey/boxstarter/issues/318).  The workaround is to login manually and the script will continue running. 
- There have been reports of Windows 1803 not successfully launching Boxstarter via the web launcher. See this issue for details: https://github.com/chocolatey/boxstarter/issues/301


## Setting up a VM
Windows 10 VM setup instructions
1. Use Hyper-V's [Quick Create](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/quick-create-virtual-machine) to set up a VM
2. Once signed in to your VM, visit this project in a web browser and click one of the script links in the Readme