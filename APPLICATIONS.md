# Included applications

DaemonCore Linux explicitly selects the following 96 Debian packages. Debian
also installs their required dependencies. Package availability is tied to the
Debian Stable repositories configured by `auto/config`.

Use security-testing software only on systems and networks you own or have
explicit authorization to assess.

## Discovery and network inspection

- `nmap` — host, service, and port discovery
- `masscan` — high-speed port discovery
- `arp-scan` — local-network ARP discovery
- `netdiscover` — active and passive ARP discovery
- `traceroute` — network path inspection
- `whois` — registration lookup client
- `dnsutils` — DNS utilities such as `dig` and `nslookup`
- `iproute2` — modern Linux networking commands
- `ethtool` — network-interface inspection
- `iperf3` — network performance measurement
- `tcpdump` — command-line packet capture
- `wireshark` — graphical packet analyzer
- `tshark` — Wireshark command-line analyzer
- `termshark` — terminal interface for TShark
- `ngrep` — pattern matching in network traffic
- `netcat-openbsd` — general-purpose TCP/UDP client and listener
- `socat` — bidirectional data relay
- `bettercap` — modular network and wireless assessment framework
- `bettercap-caplets` — Bettercap automation modules

## Wireless assessment

- `aircrack-ng` — Wi-Fi capture and authorized key auditing suite
- `hcxdumptool` — Wi-Fi packet and handshake capture
- `hcxtools` — capture conversion for Hashcat and John
- `reaver` — authorized WPS security auditing

Wireless features require a compatible adapter; monitor mode and packet
injection support depend on its chipset and driver.

## Service and protocol assessment

- `enum4linux` — SMB information enumeration
- `smbclient` — SMB/CIFS client tools
- `ldap-utils` — LDAP query and administration clients
- `snmp` — SNMP client utilities
- `onesixtyone` — SNMP device discovery
- `sslscan` — TLS service configuration analyzer

## Web assessment

- `nikto` — web-server configuration scanner
- `sqlmap` — automated SQL-injection assessment
- `dirb` — web-content discovery
- `wfuzz` — web request fuzzer
- `ffuf` — fast web fuzzer and content discovery
- `gobuster` — directory, virtual-host, and DNS discovery

## Credential auditing

- `hydra` — online authentication auditing
- `john` — John the Ripper password-auditing suite
- `hashcat` — accelerated password recovery and auditing
- `hashid` — hash-format identification
- `crunch` — controlled wordlist generator

## Forensics and reverse engineering

- `binwalk` — embedded-file and firmware analysis
- `foremost` — file carving
- `sleuthkit` — filesystem forensic tools
- `libimage-exiftool-perl` — ExifTool metadata analysis
- `yara` — pattern-based file classification
- `gdb` — GNU debugger
- `strace` — system-call tracing
- `ltrace` — library-call tracing
- `hexedit` — terminal hexadecimal editor
- `binutils` — binary inspection utilities such as `objdump`
- `xxd` — hexadecimal dump and reconstruction utility

## Scripting and development

- `python3` — Python runtime
- `python3-pip` — Python package installer
- `python3-venv` — isolated Python environments
- `pipx` — isolated Python application installer
- `ruby` — Ruby runtime
- `perl` — Perl runtime
- `build-essential` — compiler and core build toolchain
- `shellcheck` — shell-script static analysis

## Desktop and installation

- `xfce4` — XFCE desktop environment
- `xfce4-goodies` — additional XFCE utilities and plugins
- `lightdm` — graphical login manager
- `lightdm-gtk-greeter` — LightDM GTK login screen
- `calamares` — graphical system installer
- `calamares-settings-debian` — Debian installer integration
- `network-manager` — network connection service
- `network-manager-gnome` — graphical network controls
- `firewalld` — host firewall manager
- `sudo` — controlled administrative access
- `policykit-1` — desktop privilege authorization
- `pipewire-audio` — desktop audio system
- `pavucontrol` — graphical audio controls
- `gvfs` — desktop virtual filesystem integration
- `gvfs-backends` — additional remote and removable-storage support
- `thunar-archive-plugin` — archive actions for the XFCE file manager
- `file-roller` — graphical archive manager
- `firefox-esr` — web browser
- `mousepad` — graphical text editor
- `qterminal` — terminal emulator

## System, live boot, and everyday utilities

- `live-boot` — Debian live-system boot components
- `live-config` — live-session configuration
- `live-config-systemd` — systemd integration for live configuration
- `linux-image-amd64` — Linux kernel
- `firmware-linux-free` — redistributable hardware firmware
- `curl` — URL transfer client
- `wget` — network downloader
- `git` — source-control client
- `ca-certificates` — trusted certificate store
- `apt-transport-https` — APT HTTPS compatibility package
- `man-db` — manual-page system
- `less` — terminal pager
- `vim-tiny` — compact Vim editor
- `htop` — interactive process viewer
- `rsync` — file synchronization
- `unzip` — ZIP extraction
- `p7zip-full` — 7-Zip archive utilities
