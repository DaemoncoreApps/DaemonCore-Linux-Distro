"""Install an additive XDG Security menu using the installed command set."""
from pathlib import Path
import shutil
import xml.etree.ElementTree as ET

GROUPS = {
    "Recon": ("nmap", "arp-scan", "netdiscover", "whois", "dig", "traceroute"),
    "Network": ("tcpdump", "tshark", "termshark", "ngrep", "iperf3", "socat"),
    "Web": ("nikto", "sqlmap", "dirb", "wfuzz", "ffuf", "gobuster", "sslscan"),
    "Wireless": ("aircrack-ng", "hcxdumptool", "hcxpcapngtool", "reaver"),
    "Credentials": ("john", "hashcat", "hashid", "crunch", "hydra"),
    "Forensics": ("binwalk", "foremost", "yara", "exiftool", "fls"),
    "Reverse": ("gdb", "strace", "ltrace", "hexedit", "objdump"),
    "Reporting": (),
}


def install(root=Path("/")):
    applications = root / "usr/share/applications"
    directories = root / "usr/share/desktop-directories"
    merged = root / "etc/xdg/menus/applications-merged"
    for directory in (applications, directories, merged):
        directory.mkdir(parents=True, exist_ok=True)
    menu = ET.Element("Menu")
    ET.SubElement(menu, "Name").text = "Applications"
    security = ET.SubElement(menu, "Menu")
    ET.SubElement(security, "Name").text = "DaemonCore Security"
    ET.SubElement(security, "Directory").text = "daemoncore-security.directory"
    directories.joinpath("daemoncore-security.directory").write_text(
        "[Desktop Entry]\nType=Directory\nName=Security\nIcon=security-high\n", encoding="utf-8")
    for group, commands in GROUPS.items():
        category = f"DaemonCore-{group}"
        submenu = ET.SubElement(security, "Menu")
        ET.SubElement(submenu, "Name").text = group
        filename = f"daemoncore-{group.lower()}.directory"
        ET.SubElement(submenu, "Directory").text = filename
        include = ET.SubElement(submenu, "Include")
        ET.SubElement(include, "Category").text = category
        directories.joinpath(filename).write_text(
            f"[Desktop Entry]\nType=Directory\nName={group}\nIcon=applications-utilities\n", encoding="utf-8")
        for command in commands:
            if not shutil.which(command):
                continue
            applications.joinpath(f"daemoncore-tool-{command}.desktop").write_text(
                f"[Desktop Entry]\nType=Application\nName={command} help\n"
                f"Comment=Open the {command} manual\nExec=man {command}\n"
                f"TryExec={command}\nTerminal=true\nIcon=utilities-terminal\nCategories={category};\n",
                encoding="utf-8")
    ET.ElementTree(menu).write(merged / "daemoncore.menu", encoding="utf-8", xml_declaration=True)


if __name__ == "__main__":
    install()
