#!/bin/bash
# version 1.1.1
RESOLV="/etc/resolv.conf"
LOGFILE="/var/log/run.log"
DATE="$( which date )"

fix_resolv_conf() {
  if [ -f $RESOLV  ]; then
        echo 'nameserver 8.8.8.8' > $RESOLV
  fi
}

main() {
  touch $LOGFILE
  echo [$($DATE +"%T")] cleaning log file > $LOGFILE
  fix_resolv_conf

   while true; do
     sleep 3
     tail -f $LOGFILE
   done
}

main "$@"
