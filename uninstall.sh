#!/system/bin/sh

ui_print() {
  echo -e "SwapBoost: $1"
}

ui_print " "
ui_print "╔═══════════════════════════════════════════╗"
ui_print "║     SWAPBOOST UNINSTALL SEQUENCE          ║"
ui_print "╚═══════════════════════════════════════════╝"
ui_print " "
ui_print "You've taken the RED pill..."
sleep 1

ui_print "System disconnect initiated..."
sleep 0.5
ui_print "▓ ▒ █ ▓ ▒ █ ▓ ▒"
sleep 0.3
ui_print "█ ▓ ▒ █ ▓ ▒ █ ▓"
sleep 0.3
ui_print "▒ █ ▓ ▒ █ ▓ ▒ █"
sleep 0.3

ui_print " "
ui_print "Pulling you out of the Matrix..."
ui_print "[■■■■■■■■■■] - Disabling SwapBoost enhancements"
swapoff /data/swapfile 2>/dev/null
sleep 0.5

ui_print "[■■■■■    ] - Removing digital footprint"
rm -f /data/swapfile 2>/dev/null
sleep 0.5

ui_print "[■■■      ] - Clearing system memories"
if [ -d /sys/block/zram0 ]; then
  swapoff /dev/block/zram0 2>/dev/null
  echo 1 > /sys/block/zram0/reset 2>/dev/null
fi
sleep 0.5

ui_print "[■        ] - Restoring system defaults"
echo 60 > /proc/sys/vm/swappiness 2>/dev/null
sleep 0.5

ui_print "[        ] - Unplugging complete"
sleep 0.8

ui_print " "
ui_print "╔═══════════════════════════════════════════╗"
ui_print "║       SYSTEM RESTORED TO BASE REALITY     ║"
ui_print "║                                           ║"
ui_print "║  Remember... all I'm offering is the      ║"
ui_print "║  truth. Nothing more.                     ║"
ui_print "║                                           ║"
ui_print "║  Reboot to return to the system.          ║"
ui_print "╚═══════════════════════════════════════════╝"