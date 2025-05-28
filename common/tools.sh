MODPATH=/data/adb/modules/swapboost

set_perm() {
  chmod $2 "$1"
  [ -z $3 ] && chown 0:0 "$1" || chown $3:$4 "$1"
}

set_perm_recursive() {
  find "$1" -type d 2>/dev/null | while read dir; do
    set_perm "$dir" $2 $3 $4 $5
  done
  find "$1" -type f 2>/dev/null | while read file; do
    set_perm "$file" $2 $3 $6 $7
  done
}