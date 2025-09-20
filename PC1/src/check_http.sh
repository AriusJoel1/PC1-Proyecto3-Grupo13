#!/usr/bin/env bash
set -euo pipefail

# Variables configurables
URL="${URL:-https://example.com}"
POST_URL="${POST_URL:-https://httpbin.org/post}"

OUT_DIR="out"
LOG_FILE="$OUT_DIR/http.log"
mkdir -p "$OUT_DIR"

echo "[INFO] Ejecutando chequeos HTTP..." | tee "$LOG_FILE"

# --- GET ---
echo "[HTTP][GET] Probando GET a $URL" | tee -a "$LOG_FILE"
curl -sI "$URL" | sed -n '1,20p' | tee -a "$LOG_FILE"
curl -s -o /dev/null -w "[HTTP][GET] Código de estado: %{http_code}\n" "$URL" | tee -a "$LOG_FILE"

# --- POST ---
echo "[HTTP][POST] Probando POST a $POST_URL (payload: {\"ping\":\"1\"})" | tee -a "$LOG_FILE"
curl -sI -X POST -d '{"ping":"1"}' -H "Content-Type: application/json" "$POST_URL" | sed -n '1,20p' | tee -a "$LOG_FILE" || true
curl -s -o /dev/null -w "[HTTP][POST] Código de estado: %{http_code}\n" -X POST -d '{"ping":"1"}' -H "Content-Type: application/json" "$POST_URL" | tee -a "$LOG_FILE" || true

echo "[INFO] Chequeos HTTP terminados. Evidencias en $LOG_FILE"
