
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'exe'
	url            = 'https://www.killdisk.com/downloads/KillDisk-Freeware-Setup.exe'
	softwareName   = 'Active@ KillDisk 26'
	checksum       = 'E228824D8FD808865CA85409CC2A79D77028D43F145933278CEEB7FB53D539AB'
	checksumType   = 'sha256'
	silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs