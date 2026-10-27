#!/bin/bash
# ====================================================
# ANTIGRAVITY - Roblox Performance Engine (Non-Root)
# ====================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

clear
echo -e "${PURPLE}"
echo "    ___         _   _  ___ravity    "
echo "   / _ \ _ __  | |_(_)/ _ \ _ __    "
echo "  | |_| | '_ \ | __| | | | | '_ \   "
echo "  |  _  | | | || |_| | |_| | | | |  "
echo "  |_| |_|_| |_| \__|_|\___/|_| |_|  "
echo -e "${NC}================================================"
echo -e "${YELLOW} Initializing Antigravity Engine for Roblox... ${NC}"
echo -e "================================================\n"

# 1. Hardware Profiling
echo -e "${GREEN}[*] Scanning Device Hardware...${NC}"
DEV_MANUF=$(getprop ro.product.manufacturer)
DEV_MODEL=$(getprop ro.product.model)
OS_VER=$(getprop ro.build.version.release)
CPU_BOARD=$(getprop ro.board.platform)
RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
STORAGE_FREE=$(df -h /data | awk 'NR==2 {print $4}')

echo -e "  ${CYAN}Device:${NC}    $DEV_MANUF $DEV_MODEL"
echo -e "  ${CYAN}OS:${NC}        Android $OS_VER"
echo -e "  ${CYAN}Processor:${NC} $CPU_BOARD"
echo -e "  ${CYAN}RAM:${NC}       ${RAM_TOTAL} MB"
echo -e "  ${CYAN}Storage:${NC}   $STORAGE_FREE Available\n"

# 2. Permissions Check
if [ ! -d "/sdcard/Android" ]; then
    echo -e "${RED}[!] Storage permission denied! Run 'termux-setup-storage' first.${NC}"
    exit 1
fi

# 3. Aggressive Cache & Temp File Wipe
echo -e "${GREEN}[*] Executing Anti-Lag Cache Wipe...${NC}"
ROBLOX_DIR="/sdcard/Android/data/com.roblox.client"

if [ -d "$ROBLOX_DIR" ]; then
    echo -e "  ${YELLOW}-> Purging Roblox temporary data...${NC}"
    rm -rf "$ROBLOX_DIR/cache/*" 2>/dev/null
    rm -rf "$ROBLOX_DIR/files/temp/*" 2>/dev/null
    echo -e "  ${CYAN}-> Roblox cache neutralized.${NC}"
else
    echo -e "  ${RED}-> Roblox data folder not found (Is the game installed?).${NC}"
fi

echo -e "  ${YELLOW}-> Clearing global UI thumbnails & junk caches...${NC}"
find /sdcard/ -name ".thumbnails" -type d -exec rm -rf {} + 2>/dev/null
find /sdcard/ -name "*cache*" -type d -exec rm -rf {} + 2>/dev/null
echo -e "  ${CYAN}-> Background junk cleared.\n${NC}"

# 4. Non-Root Bloatware Workaround Guide
echo -e "${GREEN}[*] Antigravity Non-Root Memory Directives:${NC}"
echo -e "  Since Shizuku/Root is disabled, apply these settings manually to push 4GB RAM to the limit:"
echo -e "  ${YELLOW}1.${NC} Open Developer Options."
echo -e "  ${YELLOW}2.${NC} Set 'Background process limit' to 'At most 1 process'."
echo -e "  ${YELLOW}3.${NC} Enable 'Disable HW overlays' (forces GPU rendering for UI smoothness)."
echo -e "  ${YELLOW}4.${NC} Set Window/Transition/Animator scales to 0.5x."

echo -e "\n${PURPLE}================================================${NC}"
echo -e "${GREEN} Antigravity protocol complete. Launch Roblox! ${NC}"
echo -e "${PURPLE}================================================${NC}\n"
