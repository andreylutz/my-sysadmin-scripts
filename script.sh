#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="sys-monitor.log"

if ! touch "$LOG_FILE"; 
then
  echo "Ошибка: не удалось создать $LOG_FILE" >&2
  exit 1
fi

{
  printf '\n'
  printf 'Состояния системы: %s\n' "$(date '+%d-%m-%Y %T')"
  printf '\n'
  printf '%s\n' 'ОПЕРАТИВНАЯ ПАМЯТЬ'
  printf '%s\n' '────────────────────────────────────────────────────────────'
  free -h
  printf '\n'

  printf '%s\n' 'ДИСКОВОЕ ПРОСТРАНСТВО'
  printf '%s\n' '────────────────────────────────────────────────────────────'
  df -h
  printf '\n'

  printf '%s\n' 'ВРЕМЯ РАБОТЫ И НАГРУЗКА'
  printf '%s\n' '────────────────────────────────────────────────────────────'
  uptime
  printf '\n'
  printf '%s\n' '***'
} >> "$LOG_FILE"