#!/system/bin/sh
MODDIR=${0%/*}

CONFIG_FILE="/sdcard/swapboost.conf"
SWAPFILE="/data/swapfile"
DEFAULT_SWAP_MB=2048
DEFAULT_SWAPPINESS=160
DEFAULT_CACHE_PRESSURE=50
DEFAULT_ZRAM=true
DEFAULT_ZRAM_PRIO=-2

[ -f "$CONFIG_FILE" ] && . "$CONFIG_FILE"

SWAP_MB=${SWAP_MB:-$DEFAULT_SWAP_MB}
SWAPPINESS=${SWAPPINESS:-$DEFAULT_SWAPPINESS}
CACHE_PRESSURE=${CACHE_PRESSURE:-$DEFAULT_CACHE_PRESSURE}
ZRAM_ENABLED=${ZRAM_ENABLED:-$DEFAULT_ZRAM}
ZRAM_PRIO=${ZRAM_PRIO:-$DEFAULT_ZRAM_PRIO}

if [ ! -f "$SWAPFILE" ]; then
  dd if=/dev/zero of=$SWAPFILE bs=1M count=$SWAP_MB
  chmod 600 $SWAPFILE
  mkswap $SWAPFILE
fi

swapon -p 10 $SWAPFILE

if [ "$ZRAM_ENABLED" = true ] && [ -e /dev/block/zram0 ]; then
  swapoff /dev/block/zram0
  swapon -p $ZRAM_PRIO /dev/block/zram0
fi

[ -e /proc/sys/vm/swappiness ] && echo $SWAPPINESS > /proc/sys/vm/swappiness
[ -e /proc/sys/vm/vfs_cache_pressure ] && echo $CACHE_PRESSURE > /proc/sys/vm/vfs_cache_pressure
