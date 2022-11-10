$Installed = Get-UninstallRegistryKey -softwareName 'ESET Security'

if ($Installed){
    Uninstall-ChocolateyPackage -packageName $env:ChocolateyPackageName -fileType MSI -silentArgs "$($Installed.PSChildName) /qb /norestart" -validExitCodes @(0, 3010)
}
else {
    Write-Output 'Software is already uninstalled by other means'
}