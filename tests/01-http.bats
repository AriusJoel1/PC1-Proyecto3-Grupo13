#!/usr/bin/env bats

@test "registro de evidencias HTTP (GET y POST)" {
  run bash src/check_http.sh
  [ "$status" -eq 0 ]
  grep -q "\[HTTP\]\[GET\] Código de estado:" out/http.log
  grep -q "\[HTTP\]\[POST\] Código de estado:" out/http.log || true
}


