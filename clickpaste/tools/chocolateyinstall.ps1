$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	url           = 'https://github.com/Collective-Software/ClickPaste/releases/download/v1.3.1/ClickPaste_v1.3.1.zip'
	checksum      = 'C484A6869C8DBD8DC20E2369345011D64FE01AB9519607154C546F63123A4D40'
	checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs