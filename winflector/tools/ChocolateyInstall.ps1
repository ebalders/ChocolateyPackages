﻿$ErrorActionPreference = 'Stop'
$packageName    = 'winflector'
$global:packageMaintainer = 'BCURRAN3'
$softwareName   = 'Winflector*'
$installerType  = 'EXE'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'http://www.winflector.com/store/free-version/index/id/373' 
$checksum       = 'BC97A47C34F962FAF3DE3621D18DCEC3B00ED5D233452D9C32E6547C7BDF7C32'
$silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0, 3010, 1641)
$ahkExe         = 'AutoHotKey'
$ahkFile        = Join-Path $toolsDir "WinflectorInstall.ahk"

Start-Process $ahkExe $ahkFile

$packageArgs = @{
  packageName   = $packageName
  fileType      = $installerType
  url           = $url
  validExitCodes= $validExitCodes
  silentArgs    = $silentArgs
  softwareName  = $softwareName
  checksum      = $checksum
  checksumType  = 'sha256' 
}

Show-Patreon "https://www.patreon.com/bcurran3"
Install-ChocolateyPackage @packageArgs  
Show-ToastMessage "$packageName installed." "Version $env:packageVersion."
