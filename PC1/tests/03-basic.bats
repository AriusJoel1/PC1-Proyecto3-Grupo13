#!/usr/bin/env bats

@test "script principal imprime mensaje" {
  run bash src/main.sh
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Sprint 1" ]]
}
