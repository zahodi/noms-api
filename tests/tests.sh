#!/usr/bin/env bats

cd "${BATS_TEST_DIRNAME}/"
cd ../

@test "Verify example_bin.sh returns 'it works'" {
  output=$(./bin/example_bin.sh)
  [ "$output" == 'it works' ]
}

@test "Test travis" {
  ./bin/example_bin.sh 
}
