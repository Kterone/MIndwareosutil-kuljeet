# MindwareOS MindwareUtil - Cool Edition

**Made by Kuljeet** | Version 1.0  
Platform: Arch Linux / Arch-based distributions  
Purpose: Privacy & Security Utility (Chris Titus-style)

---

## Overview

MindwareUtil is a **modular Bash utility** designed to simplify system setup on Arch-based Linux distributions. It focuses on **privacy, security, and system hardening**, while offering:

- Installation of privacy-focused packages  
- Security & firewall configuration  
- System auditing and hardening  
- Interactive menu and dry-run mode  
- Color-coded terminal output and logging  

---

## Features

- ✅ System Update  
- ✅ Privacy Packages Installation  
- ✅ Security Packages Installation  
- ✅ Encryption & Privacy Tools  
- ✅ Firewall Setup  
- ✅ Fail2Ban Activation  
- ✅ Security Audits  

---

## Usage

1. **Save and make executable:**
```bash
chmod +x ~/mindwareutil.sh
```

2. **Run the script:**

Full automatic install:
```bash
~/mindwareutil.sh
```

Dry-run (preview actions):
```bash
~/mindwareutil.sh --dry-run
```

Interactive menu:
```bash
~/mindwareutil.sh --menu
```

3. **Logs:**  
All actions are logged to `~/mindwareutil.log`.

---

## Notes

- Safe to re-run; packages installed with `--needed`.  
- Manual configuration recommended for **firejail, AppArmor/SELinux, Tor, and encryption tools**.  
- Always inspect scripts before running with `sudo`.

---

## Screenshots

 _______ _           _                                     _ _  
(_______|_)         | |                                _  (_) | 
 _  _  _ _ ____   __| |_ _ _ _____  ____ _____ _   _ _| |_ _| | |----------------------------------------|
| ||_|| | |  _ \ / _  | | | (____ |/ ___) ___ | | | (_   _) | | |------- DITCH WINDOWS AND MACOS --------|
| |   | | | | | ( (_| | | | / ___ | |   | ____| |_| | | |_| | | |----------------------------------------|
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


MindwareOS MindwareUtil - Made by Kuljeet

---

## Credits

- Developed by **Kuljeet**  
- Inspired by Chris Titus Tech LinUtil  
- MindwareOS branding

---

## License

This utility is **free to use and modify**. Attribution to Kuljeet is appreciated.  
Use responsibly. The author is not responsible for misuse or damages.
