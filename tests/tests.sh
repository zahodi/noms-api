#!/usr/bin/env bats

@test "Verify example_bin.sh returns 'it works'" {
  cd "${BATS_TEST_DIRNAME}/"
  cd ../

  output=$(./bin/example_bin.sh)
  [ "$output" == 'it works' ]
}

@test "Test travis" {
  
  cd "${BATS_TEST_DIRNAME}/"
  cd ../

  ls ./bin/example_bin.sh
}
