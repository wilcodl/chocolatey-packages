$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	url           = 'https://github.com/Collective-Software/ClickPaste/releases/download/v1.0.1/ClickPaste_v1.0.1.zip'
	checksum      = 'C6946857FC733CFF1417DEA2EEB46D3CCD03CFDE462DA3D3830ACB40B3335568'
	checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs