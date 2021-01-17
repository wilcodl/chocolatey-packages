
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
	checksum       = '4C6919D7BB3BE0676F79A66B1F51597BA0CA53224D181CC90E85CC2BF7D0CA1A'
	checksumType   = 'sha256'
	checksum64     = 'CC568008E7DBFB9F8B93E35A167EEDCCDF72799C74A713961066EB0032D455C9'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eav'
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs