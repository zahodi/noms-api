#!/usr/bin/env bats

@test "Verify example_bin.sh returns 'it works'" {
  cd "${BATS_TEST_DIRNAME}/"
  cd ../

  output=$(./bin/example_bin.sh)
  [ "$output" == 'it works' ]
}
