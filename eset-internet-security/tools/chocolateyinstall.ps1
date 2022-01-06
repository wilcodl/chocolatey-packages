
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
	checksum       = '384089C5ED4FE0B31A833EBB5A2AFCFF62EAC9C0F269BFDB13CFED7C37447539'
	checksumType   = 'sha256'
	checksum64     = '519CF934ADBB0A612D7FB953FA32A146A56D20BCC5F9EF3AA48ABE2D6C439326'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eis'
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs