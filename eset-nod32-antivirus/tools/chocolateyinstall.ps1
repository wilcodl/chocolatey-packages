
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
	checksum       = 'CCFE369A891122DD7C67D9BF322F7364E5FC7C7664CEA9E9431C0C2255FC6AAE'
	checksumType   = 'sha256'
	checksum64     = '2CDE0B59852E5EE8C3279B08C14DBFD5918353ED03338A00C353A24C45275A54'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eav'
	validExitCodes = @(0, 5022) # 5022: version already current
}

Install-ChocolateyPackage @packageArgs