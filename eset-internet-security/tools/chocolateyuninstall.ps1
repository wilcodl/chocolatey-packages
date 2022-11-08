# Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force

Uninstall-ChocolateyPackage -packageName $env:ChocolateyPackageName -fileType MSI -silentArgs "{DC8185CE-C7E6-4812-9674-42919F445464} /qb /norestart" -validExitCodes @(0, 3010)