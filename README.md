# SwapBoost Pro v1.0

<img src="" width="300">

## 💥 Description
SwapBoost Pro is an advanced RAM management module that optimizes your device's memory performance through persistent zRAM + Swapfile optimization with VM tweaks.

## ✨ Features
- Persistent swapfile that survives reboots
- Optimized zRAM configuration
- Fine-tuned VM parameters for better performance
- Custom user configuration support
- Matrix-themed installation experience

## 📲 Installation
1. Download the latest release zip
2. Install via Magisk Manager or custom recovery
3. Reboot your device
4. (Optional) Create `/sdcard/swapboost.conf` to customize settings

## ⚙️ Configuration
Create a file at `/sdcard/swapboost.conf` with these options:
```bash
# SwapBoost configuration
SWAP_MB=2048    # Size of swapfile in MB
ZRAM_PRIO=-2    # zRAM priority (-1 to -10)
```
## 👨‍💻 Author
Created by @yadavnikhil03
