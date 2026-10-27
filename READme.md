# 🚀 Roblox Booster (Antigravity Engine)

A lightweight Termux script designed to maximize Roblox performance and fix lag on low-end (4GB RAM) Android devices. Operates completely **without Root or Shizuku**.

Perfect for getting ultra-smooth gameplay on heavy servers like *Steal an Egg*.

## ✨ Features
- 📱 **Hardware Profiling:** Auto-detects device OS, CPU, RAM, and Storage availability.
- 🧹 **Aggressive Cache Wipe:** Purges Roblox temp data, `.thumbnails`, and global junk files to stop micro-stutters.
- ⚡ **Non-Root Optimizations:** Guides you through memory directives to force the GPU to handle UI rendering, freeing up your CPU for gaming.

⚠️ Prerequisites
​Make sure you have granted storage permissions to Termux so the script can clear the cache files. If you haven't done this yet, run:

🛠️ Recommended Developer Options
​For the best results alongside this script, set these in your Android Developer Options:
​Background process limit: At most 1 process
​Disable HW overlays: Enabled (Forces GPU for screen compositing)
​Animator duration scale: 0.5x


## ⚙️ Quick Start (Termux)

You don't need to download the file manually. Just copy and paste this one-liner into Termux to execute the booster directly:

```bash
curl -sL https://raw.githubusercontent.com/country2013ball-sudo/Roblox-Booster/main/antigravity.sh | bash



