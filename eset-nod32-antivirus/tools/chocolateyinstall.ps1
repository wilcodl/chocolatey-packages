
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

# checksum -t sha256 -f D:\eav_nt64_enu.exe

$packageArgs = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $toolsDir
	fileType       = 'EXE'
	url            = 'https://download.eset.com/download/win/eav/eav_nt32_enu.exe'
	url64bit       = 'https://download.eset.com/download/win/eav/eav_nt64_enu.exe'
	softwareName   = 'ESET Security'
	checksum       = '7F124052A797F802FBC3B8149733C3503586F63518D310A0A8C587DDCEB46E20'
	checksumType   = 'sha256'
	checksum64     = 'E34546AC5056DF0CE056012C46D13367CC9C1C797FFDE3D540B8856D73A17CAE'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eav'
	validExitCodes = @(0, 5022) # 5022: version already current
}

Install-ChocolateyPackage @packageArgs