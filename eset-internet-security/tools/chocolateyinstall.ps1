
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
	url            = 'https://download.eset.com/com/eset/apps/home/eis/windows/latest/eis_nt32.exe'
	url64bit       = 'https://download.eset.com/com/eset/apps/home/eis/windows/latest/eis_nt64.exe'
	softwareName   = 'ESET Security'
	checksum       = '8CFD0F84EA871F814B7E9178780C65FF52AC7448902FA6D38A91A96A68C7C859'
	checksumType   = 'sha256'
	checksum64     = '7EBF7C4FC914F353AACDB5EC8D3472346174E80B9EC4F9C6D0159BBA1EC6A8C5'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eis'
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs