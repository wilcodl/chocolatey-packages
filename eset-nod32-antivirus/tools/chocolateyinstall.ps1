
$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

[double]$WinVersion = [Environment]::OSVersion.Version.Major.toString() + "." + [Environment]::OSVersion.Version.Minor.toString()

if ($WinVersion -lt 6.1){
	throw 'Windows version not supported'
}

$OS = Get-CimInstance -ClassName Win32_OperatingSystem

if ($OS.ProductType -ne 1){
	throw 'Only Windows client versions supported'
}

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'EXE'
	url            = 'https://download.eset.com/download/win/eav/eav_nt32_enu.exe'
	url64bit       = 'https://download.eset.com/download/win/eav/eav_nt64_enu.exe'
	softwareName   = 'ESET Security'
	checksum       = 'CF72BD8AB7B7B7EA53636D670BCAF322858C19EB268296607D478B40A6283E87'
	checksumType   = 'sha256'
	checksum64     = '46BFFE6D1A3128AD2C2EA0E6019AA41040F54BA03DDD7D54EED1E9A4826F3EBB'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eav'
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs