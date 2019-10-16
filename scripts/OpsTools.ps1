#--- Docker ---
Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install -y docker-for-windows
choco install -y vscode-docker

#--- AWS Tools and Terraform ---
choco install -y awscli
choco install -y aws-vault
choco install -y terraform --version 0.11.8
choco install -y packer