#!/system/bin/sh

SWAPFILE="/data/swapfile"
CONFIG="/sdcard/swapboost.conf"

# Default settings
SWAP_MB=2048
ZRAM_PRIO=-2

# Load user config if it exists
[ -f "$CONFIG" ] && . "$CONFIG"

# Create swapfile if it doesn't exist
if [ ! -f "$SWAPFILE" ]; then
  dd if=/dev/zero of=$SWAPFILE bs=1M count=$SWAP_MB
  chmod 600 $SWAPFILE
  mkswap $SWAPFILE
fi

# Enable swap
swapon $SWAPFILE

# Tune zRAM if available
if [ -e /dev/block/zram0 ]; then
  swapoff /dev/block/zram0
  swapon -p $ZRAM_PRIO /dev/block/zram0
fi

# VM tweaks
sysctl -w vm.swappiness=120
sysctl -w vm.vfs_cache_pressure=50
