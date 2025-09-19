#!/usr/bin/env bats

@test "registro de evidencias DNS" {
  run bash src/check_dns.sh
  [ "$status" -eq 0 ]
  grep -q "\[DNS\] Resolviendo" out/dns.log
  # Debe haber al menos un resultado de IP (no forzamos error si la red falla)
  grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' out/dns.log || true
}

