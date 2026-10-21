# Security workstation

The Applications menu includes Security categories for Recon, Network, Web,
Wireless, Credentials, Forensics, Reverse, and Reporting. Tool entries open
their manual in a terminal; run commands from your terminal after reviewing
the options. Only commands present in the image receive launchers.

Choose **Security → Reporting → New Assessment** to create a private workspace
under `~/Assessments/`. Enter a short name using letters, digits, hyphens, or
underscores. Existing workspaces are never overwritten.

The command also works from a terminal:

```sh
daemoncore-assessment client-review
daemoncore-assessment client-review --directory /path/to/private/storage
```

Each assessment includes scope, notes, captures, evidence, findings, and reports
folders, with authorization, timeline, finding, and report templates. Files use
owner-only permissions. Complete the scope before running tools and retain
original evidence separately from report drafts. If creation fails, partial
files are retained for inspection rather than deleted.

## Build and boot acceptance

Build using the Debian host requirements in README.md. Before publishing an ISO:

- Verify its SHA-256 checksum and record the build log.
- Boot in BIOS and UEFI virtual machines and confirm the non-root XFCE session.
- Check each Security submenu and create an assessment using the menu action.
- Confirm a second assessment with the same name leaves existing files intact.
- Exercise networking, packet capture, installer, and USB persistence.
- Check Wi-Fi adapter and GPU support on representative physical hardware.

The current Windows development host has Ubuntu under WSL, but lacks live-build,
debootstrap, and QEMU. Docker's Linux engine is stopped. ISO build and boot
acceptance remain pending on a prepared Debian build host.
