﻿# Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force

Uninstall-ChocolateyPackage -packageName $env:ChocolateyPackageName -fileType MSI -silentArgs "{09517F4E-77D2-46C8-8C8D-EE66D0556D3D} /qb /norestart" -validExitCodes @(0, 3010)