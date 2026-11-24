# DaemonCore visual themes

DaemonCore Linux includes a coordinated violet-and-teal visual identity for
the XFCE desktop and LightDM login screen.

New accounts receive a top panel with the DaemonCore menu, welcome launcher,
window list, notification tray, volume, clock, and session controls. The welcome
window links to assessments, offline guides, official Academy releases, and
appearance settings. Disable its login startup using the checkbox; reopen it
from Applications at any time.

The DaemonCore icon theme inherits Adwaita and adds a branded application mark.
QTerminal uses a graphite background with violet, teal, and readable ANSI colors.
LightDM uses Core Horizon and the same dark theme with the DaemonCore user mark.
These defaults apply to new accounts; existing profiles retain their settings.

## Wallpapers

### Core Horizon

The default desktop and login wallpaper. A layered central core with balanced
violet and teal illumination.

![Core Horizon](config/includes.chroot/usr/share/backgrounds/daemoncore/core-horizon.png)

### Silent Grid

A minimal, low-distraction option for long desktop sessions.

![Silent Grid](config/includes.chroot/usr/share/backgrounds/daemoncore/silent-grid.png)

### Neon Citadel

A cinematic option for demonstrations and live-session screenshots.

![Neon Citadel](config/includes.chroot/usr/share/backgrounds/daemoncore/neon-citadel.png)

### Core Signal

A branded circuit-core design with a spacious layout and prominent
DaemonCore Linux title.

![Core Signal](config/includes.chroot/usr/share/backgrounds/daemoncore/core-signal.png)

### Midnight Protocol

A calm geometric horizon with a centered DaemonCore Linux title for everyday
desktop use.

![Midnight Protocol](config/includes.chroot/usr/share/backgrounds/daemoncore/midnight-protocol.png)

Inside DaemonCore, select a wallpaper from **Desktop Settings → Background**.
The files are installed in `/usr/share/backgrounds/daemoncore/`.

## GTK themes

- **DaemonCore Dark** is the default graphite theme with violet selection and
  teal focus accents.
- **DaemonCore Black** is a higher-contrast near-black alternative with cyan
  highlights.

Switch themes from **Settings → Appearance → Style**. Theme files are installed
under `/usr/share/themes/` and inherit Debian's maintained Adwaita Dark base.
