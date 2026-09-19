#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="sys-monitor.log"

if ! touch "$LOG_FILE"; 
then
  echo "Ошибка: не удалось создать $LOG_FILE" >&2
  exit 1
fi

{
  printf '%s\n' "$(date '%T +%d-%m-%Y')"
  free -h
  df -h
  uptime
  printf '\n'
} >> "$LOG_FILE"