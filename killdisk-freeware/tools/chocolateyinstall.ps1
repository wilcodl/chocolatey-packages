
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'exe'
	url            = 'https://www.killdisk.com/downloads/KillDisk-Freeware-Setup.exe'
	softwareName   = 'Active@ KillDisk 14'
	checksum       = '2EC0C230FEBFD5D1DB31B86BD99C0992C69108C039B106787E9FC21E1E6DA697'
	checksumType   = 'sha256'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs