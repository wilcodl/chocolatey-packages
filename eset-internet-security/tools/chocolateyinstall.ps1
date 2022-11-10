$ErrorActionPreference = 'Stop'

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
	fileType       = 'EXE'
	url            = 'https://download.eset.com/com/eset/apps/home/eis/windows/latest/eis_nt32.exe'
	url64bit       = 'https://download.eset.com/com/eset/apps/home/eis/windows/latest/eis_nt64.exe'
	checksum       = 'F18DA6700CBEA3A1C7FCDDF91D68C0710808E2F234B4E92CFD810DB98DF7F118'
	checksumType   = 'sha256'
	checksum64     = '57FA2791AC43DC5F9B26AC2C0F6219EDCA9BFD1D5F56529346769C4323C1B73A'
	checksumType64 = 'sha256'
	silentArgs     = '--silent --accepteula --msi-property-ehs PRODUCTTYPE=eis'
	validExitCodes = @(0, 5022) # 5022: version already current
}

$InstalledPackage = Get-UninstallRegistryKey -softwareName 'ESET Security' -WarningAction SilentlyContinue

if ($InstalledPackage.DisplayVersion -eq $env:ChocolateyPackageVersion){
	Write-Output 'Version is already current'
}
else {
	Install-ChocolateyPackage @packageArgs
}