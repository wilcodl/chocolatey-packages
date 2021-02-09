
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$fileLocation = Join-Path -Path $toolsDir -ChildPath 'setup.exe'

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	fileType       = 'exe'
	file            = $fileLocation
	softwareName   = 'UnderCover10 version 3.00'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs