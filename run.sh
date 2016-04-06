#!/bin/bash
# version 1.2.1
LOGFILE="/var/log/run.log"
DATE="$( which date )"

fix_resolv_conf() {
  if [ -f /etc/resolv.conf  ]; then
        echo 'nameserver 8.8.8.8' > /etc/resolv.conf
  fi
}

main() {
  touch $LOGFILE
  echo [$($DATE +"%T")] cleaning log file > $LOGFILE
  fix_resolv_conf

# while true; do
#   sleep 3
#   tail -f $LOGFILE
#  done
}

main "$@"
