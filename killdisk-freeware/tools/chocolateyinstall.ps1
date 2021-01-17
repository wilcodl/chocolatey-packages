
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'exe'
	url            = 'https://www.killdisk.com/downloads/KillDisk-Freeware-Setup.exe'
	softwareName   = 'Active@ KillDisk 13'
	checksum       = '01125D0363DF7E62DFFA8BE5BB022BA1B4FA6782697F336B7E13CB05EFD82048'
	checksumType   = 'sha256'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs