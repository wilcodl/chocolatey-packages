function Install-ChocolateyPackage {}

$Urls = @()

. ".\eset-nod32-antivirus\tools\chocolateyinstall.ps1"
$Urls += $packageArgs.url
$Urls += $packageArgs.url64bit

. ".\eset-internet-security\tools\chocolateyinstall.ps1"
$Urls += $packageArgs.url
$Urls += $packageArgs.url64bit

foreach ($Url in $Urls){
	$FileName = ([uri]$Url).Segments[-1]
	$TempPath = "$env:TEMP\$FileName"

	if (-not (Test-Path $TempPath)){
		Start-BitsTransfer -Source $Url -Destination $TempPath
	}

	$FileInfo = Get-Item $TempPath
	$FileHash = Get-FileHash -Path $TempPath -Algorithm SHA256
	$FileSize = [Math]::Round(($FileInfo.Length / 1MB), 2)

	[PSCustomObject]@{
		FileName	= $FileName
		Version		= $FileInfo.VersionInfo.ProductVersion
		SizeMB		= $FileSize
		# Algorithm	= $FileHash.Algorithm
		Hash		= $FileHash.Hash
	}
}