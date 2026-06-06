$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	url           = 'https://helgeklein.com/files/DelProf2/current/Delprof2%201.6.0.zip'
	checksum      = '14EE8BAF68AC5B015613ECDF23D1CC49A7045F791E2F7A1952F32AAD5B4A606B'
	checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs