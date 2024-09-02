
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'exe'
	url            = 'https://www.killdisk.com/downloads/KillDisk-Freeware-Setup.exe'
	softwareName   = 'Active@ KillDisk 24'
	checksum       = '95EF0C8D2D24954688133519C09A4A47B6B2BA44D1CD488AFAB5A3522DC842BF'
	checksumType   = 'sha256'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs