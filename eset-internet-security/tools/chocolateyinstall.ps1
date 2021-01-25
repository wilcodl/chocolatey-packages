
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
	checksum       = '552164B5ED913125F8C2D038E26F1C689FC1F6371806A2EF009C7F58D4795725'
	checksumType   = 'sha256'
	checksum64     = 'F15D90DBCE44207F7B2A519A0CF719668F6F246EED2C2E72A75C52B2B117D4E1'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eis'
	validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs