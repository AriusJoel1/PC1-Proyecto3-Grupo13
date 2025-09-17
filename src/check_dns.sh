#!/usr/bin/env bash
set -euo pipefail

# Variables configurables
DOMAIN="${DOMAIN:-example.com}"
DNS_SERVER="${DNS_SERVER:-}"   # si vacío, dig usará servidores por defecto
TARGETS="${TARGETS:-$DOMAIN}"

OUT_DIR="out"
LOG_FILE="$OUT_DIR/dns.log"
mkdir -p "$OUT_DIR"

echo "[INFO] Ejecutando chequeos DNS..." | tee "$LOG_FILE"

for host in $TARGETS; do
  echo "[DNS] Resolviendo $host (A record)" | tee -a "$LOG_FILE"
  if [ -n "$DNS_SERVER" ]; then
    dig +short A "$host" @"$DNS_SERVER" | tee -a "$LOG_FILE"
  else
    dig +short A "$host" | tee -a "$LOG_FILE"
  fi
done

echo "[INFO] Chequeos DNS terminados. Evidencias en $LOG_FILE"
