#!/usr/bin/env bash
# LinUtil Cool Edition for MindwareOS
# Made by Kuljeet

set -euo pipefail
LOGFILE="$HOME/linutil.log"
DRY_RUN=0

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Banner
banner() {
cat << "EOF"
  _______ _           _                                     _ _  
(_______|_)         | |                                _  (_) | 
 _  _  _ _ ____   __| |_ _ _ _____  ____ _____ _   _ _| |_ _| | 
| ||_|| | |  _ \ / _  | | | (____ |/ ___) ___ | | | (_   _) | | ------- DITCH WINDOWS AND MACOS
| |   | | | | | ( (_| | | | / ___ | |   | ____| |_| | | |_| | | 
|_|   |_|_|_| |_|\____|\___/\_____|_|   |_____)____/   \__)_|\_)                                    
                               ;::::::::.            .;::::::,.  .,                               
                               ;::::::::.       ..  ',;:::;'.  .,::                               
                               ;:::::::;. ..',;;:::;,'....   .;::::                               
                               ;:::::;..';::::::::::::::;.. ,::::::                               
                               ;::::'.;::::::::::::::::::;',..:::::                               
                               ;:::; ;::::::::::::::::::::.;:..::::                               
                               ;:::'.:;''''''''''''''',;::',:; ::::                               
                               ;:::...';:::::::::::::;,'''.,:: ;:::                               
                               ;;'.','...',,'',,,',;::::::;.., ;:::                               
                               ....  .';llo:;;ll,;';,'',,'.'. .:::;                               
                               '    .,;ccc:'x::l:do;;l;,:,l:; ':::'                               
                                ... ,.:c'o;kOkl;llOOolc,::c::..:::.                               
                                ,::.' ;o,;::;cOkoc0dl,''..;c:, ::;                                
                                .;:'  .l,,O:.'OO0OO0,.'O,,cl;: ,:.                                
                                 .::' ;;:o0dllOO0OO0oldO0,lc.:...                                 
                                  .:..:l.:OOOOOOOOOOkOOOo'o:..'                                   
                                   ...,;..dOOOOkkOxOOOOl.lc...                                    
                                      ..,'';oxOOOOOOxl,.;;. .                                     
                                       ...'l::::olc,':.,'..                                       
                                        .'':llclcccll:,:;'                                        
                                          .;:cclllll:c:.                                          
                                            .';::::;'.                                            
                                               .''.                                               
                                                                                                  
            ..    ..  .. ..   .. .....  ..   ..  ..  ..    ....   .....  ....   ....              
            ;:,  .::..:. ,:,  :' ,:..,;..:. ':, .:' .::'  .:,.,;. :,... ;;..;; .:'.,'             
            ;;;. ;,:..:. ,;;' :' ,:  .:. ;' ;;:..:  ,;';  .:. .:. :,.. .:'  .:..;'.               
            ;,.;,,.:..:. ,;.;':' ,:  .:. ';.;.;.;, .:..:. .:;,:.  :;....:'  .:.  .,;.             
            ;, ', .:..:. ,; .;:' ,:  ':. .:;' ';:. ';',;; .:..;,  :,   .:,  ':..'  ,:             
            ''    .,  ,. .'  .,. .,,,'.   ',.  ,,  ,.  .,..,. .,. ,,,,. .',,,.  ',,,. 
EOF
echo -e "${CYAN}        MindwareOS Utility - Made by Kuljeet${RESET}"
echo
}

# Core package lists
PRIVACY_PACKAGES=( firefox tor torbrowser-launcher ungoogled-chromium brave wireguard-tools openvpn dnscrypt-proxy )
SECURITY_PACKAGES=( ufw gufw fail2ban rkhunter chkrootkit lynis firejail apparmor selinux audit clamav )
ENCRYPTION_PACKAGES=( gpg gnupg pass veracrypt cryptsetup mat2 bleachbit )
ALL_PACKAGES=( "${PRIVACY_PACKAGES[@]}" "${SECURITY_PACKAGES[@]}" "${ENCRYPTION_PACKAGES[@]}" )

# Utility functions
log() { echo -e "${YELLOW}[$(date -Iseconds)]${RESET} $*" | tee -a "$LOGFILE"; }
run() { if [ "$DRY_RUN" -eq 1 ]; then echo -e "${BLUE}[DRY-RUN]${RESET} $*"; else log "RUN: $*"; eval "$@"; fi; }

usage(){ cat <<USAGE
LinUtil Cool Edition
Usage: $0 [--dry-run] [--menu]

--dry-run : preview actions without applying
--menu    : interactive menu
--help    : show this message
USAGE
}

# Parse arguments
INTERACTIVE=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --menu) INTERACTIVE=1 ;;
    -h|--help) usage; exit 0 ;;
  esac
done

# Functions
update_system() {
    echo -e "${GREEN}Updating system...${RESET}"
    run "sudo pacman -Syu --noconfirm"
}

install_packages() {
    local pkgs=("$@")
    echo -e "${GREEN}Installing packages: ${pkgs[*]}${RESET}"
    run "sudo pacman -S --needed --noconfirm ${pkgs[*]}"
}

setup_firewall() {
    echo -e "${GREEN}Setting up firewall (ufw)...${RESET}"
    run "sudo systemctl enable --now ufw.service || true"
    run "sudo ufw default deny incoming"
    run "sudo ufw default allow outgoing"
    echo "SSH port not opened by default. Run 'sudo ufw allow ssh' if needed."
    run "sudo ufw --force enable"
}

setup_fail2ban() {
    echo -e "${GREEN}Enabling Fail2Ban...${RESET}"
    if command -v fail2ban-server >/dev/null 2>&1; then
        run "sudo systemctl enable --now fail2ban.service"
    fi
}

scan_security() {
    echo -e "${GREEN}Running security scans...${RESET}"
    for tool in rkhunter chkrootkit lynis; do
        if command -v "$tool" >/dev/null 2>&1; then
            run "sudo $tool --update || true"
            run "sudo $tool --check || true"
        fi
    done
}

interactive_menu() {
    if ! command -v whiptail >/dev/null 2>&1; then
        run "sudo pacman -S --needed --noconfirm whiptail"
    fi

    OPTIONS=(
        1 "Update system" ON
        2 "Install Privacy Packages" ON
        3 "Install Security Packages" ON
        4 "Install Encryption & Privacy Tools" ON
        5 "Setup Firewall" ON
        6 "Enable Fail2ban" ON
        7 "Run Security Scan" ON
    )

    CHOICES=$(whiptail --title "LinUtil Modules" --checklist "Select actions to perform" 25 70 20 "${OPTIONS[@]}" 3>&1 1>&2 2>&3)
    CHOICES=${CHOICES//\"/} # remove quotes

    for choice in $CHOICES; do
        case $choice in
            1) update_system ;;
            2) install_packages "${PRIVACY_PACKAGES[@]}" ;;
            3) install_packages "${SECURITY_PACKAGES[@]}" ;;
            4) install_packages "${ENCRYPTION_PACKAGES[@]}" ;;
            5) setup_firewall ;;
            6) setup_fail2ban ;;
            7) scan_security ;;
        esac
    done
}

# Main
banner

if [ "$INTERACTIVE" -eq 1 ]; then
    interactive_menu
else
    log "Running LinUtil full install (all modules)"
    update_system
    install_packages "${ALL_PACKAGES[@]}"
    setup_firewall
    setup_fail2ban
    scan_security
fi

log "LinUtil finished. Check $LOGFILE for details."
echo -e "${CYAN}Remember to configure AppArmor/SELinux, firejail profiles, and encryption manually.${RESET}"

