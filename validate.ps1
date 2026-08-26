$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$RequiredPaths = @(
    'auto/config',
    'build.sh',
    'config/package-lists/desktop.list.chroot',
    'config/package-lists/daemoncore.list.chroot',
    'config/hooks/live/0100-daemoncore-identity.hook.chroot',
    'config/hooks/live/0200-daemoncore-hardening.hook.chroot',
    'config/includes.chroot/etc/os-release'
)

foreach ($RelativePath in $RequiredPaths) {
    $FullPath = Join-Path $ProjectRoot $RelativePath
    if (-not (Test-Path -LiteralPath $FullPath -PathType Leaf)) {
        throw "Required file is missing: $RelativePath"
    }
}

$PackageFiles = Get-ChildItem -LiteralPath (Join-Path $ProjectRoot 'config/package-lists') -Filter '*.list.chroot'
$Packages = foreach ($PackageFile in $PackageFiles) {
    Get-Content -LiteralPath $PackageFile.FullName |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') }
}

$Duplicates = $Packages | Group-Object | Where-Object Count -gt 1
if ($Duplicates) {
    throw "Duplicate package entries: $($Duplicates.Name -join ', ')"
}

$InvalidPackages = $Packages | Where-Object { $_ -notmatch '^[a-z0-9][a-z0-9+.-]*$' }
if ($InvalidPackages) {
    throw "Invalid package names: $($InvalidPackages -join ', ')"
}

$ShellFiles = Get-ChildItem -LiteralPath $ProjectRoot -Recurse -File |
    Where-Object { $_.Name -match '(^build\.sh$|^clean\.sh$|^config$|^build$|^clean$|\.hook\.chroot$)' }

foreach ($ShellFile in $ShellFiles) {
    $Bytes = [System.IO.File]::ReadAllBytes($ShellFile.FullName)
    if ($Bytes -contains 13) {
        throw "Shell file contains CRLF line endings: $($ShellFile.FullName)"
    }
}

Write-Host "DaemonCore scaffold validation passed ($($Packages.Count) packages)."
