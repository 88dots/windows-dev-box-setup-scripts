Write-Host "Downloading VS Build Tools installer..."

Invoke-WebRequest -Uri https://raw.githubusercontent.com/88dots/windows-dev-box-setup-scripts/master/files/build.vsconfig -OutFile "$($env:temp)\build.vsconfig" -UseBasicParsing
Invoke-WebRequest -Uri https://aka.ms/vs/16/release/vs_buildtools.exe -OutFile "$($env:temp)\vs_buildstools.exe" -UseBasicParsing

$startInfo = New-Object System.Diagnostics.ProcessStartInfo
$startInfo.FileName = "$($env:temp)\vs_buildstools.exe"
$startInfo.Arguments = "--quiet --wait --norestart --nocache --installPath C:\VS --config $($env:temp)\build.vsconfig"
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $startInfo
$process.Start()
$process.WaitForExit()

Write-Host "Installing VS Build Tools..."