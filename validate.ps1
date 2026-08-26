$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$RequiredPaths = @(
    'auto/config',
    'build.sh',
    'config/package-lists/desktop.list.chroot',
    'config/package-lists/daemoncore.list.chroot',
    'config/hooks/live/0100-daemoncore-identity.hook.chroot',
    'config/hooks/live/0200-daemoncore-hardening.hook.chroot',
    'config/includes.chroot/etc/os-release',
    'config/includes.chroot/usr/share/backgrounds/daemoncore/core-horizon.png',
    'config/includes.chroot/usr/share/backgrounds/daemoncore/silent-grid.png',
    'config/includes.chroot/usr/share/backgrounds/daemoncore/neon-citadel.png',
    'config/includes.chroot/usr/share/themes/DaemonCore-Dark/gtk-3.0/gtk.css',
    'config/includes.chroot/usr/share/themes/DaemonCore-Black/gtk-3.0/gtk.css',
    'config/includes.chroot/usr/share/applications/daemoncore-guides.desktop',
    'config/includes.chroot/usr/share/doc/daemoncore/guidebook/index.html'
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

$GuideRoot = Join-Path $ProjectRoot 'config/includes.chroot/usr/share/doc/daemoncore/guidebook'
$GuideFiles = Get-ChildItem -LiteralPath $GuideRoot -Filter '*.html'
foreach ($GuideFile in $GuideFiles) {
    $GuideContent = Get-Content -Raw -LiteralPath $GuideFile.FullName
    $LocalLinks = [regex]::Matches($GuideContent, 'href="([^"]+)"') |
        ForEach-Object { $_.Groups[1].Value } |
        Where-Object { $_ -notmatch '^(https?:|#)' }

    foreach ($LocalLink in $LocalLinks) {
        $LinkPath = Join-Path $GuideFile.DirectoryName $LocalLink
        if (-not (Test-Path -LiteralPath $LinkPath -PathType Leaf)) {
            throw "Broken guidebook link in $($GuideFile.Name): $LocalLink"
        }
    }
}

Write-Host "DaemonCore scaffold validation passed ($($Packages.Count) packages)."
