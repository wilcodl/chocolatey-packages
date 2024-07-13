
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'exe'
	url            = 'https://www.killdisk.com/downloads/KillDisk-Freeware-Setup.exe'
	softwareName   = 'Active@ KillDisk 24'
	checksum       = '093FE53B140666C09A02336549990E1334D0DD41BB689F5F8B22C097F23D958C'
	checksumType   = 'sha256'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs