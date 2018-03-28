#!/usr/bin/env bats

cd "${BATS_TEST_DIRNAME}/"
cd ../

json_all='{"groups": {"group1": {"foo": "bar"}},"hosts": {"host1": {} }}'

@test "Verify jq command available" {
  which jq
}

#@test "Verify example_bin.sh returns 'it works'" {
#  output=$(./bin/example_bin.sh)
#  [ "$output" == 'it works' ]
#}

@test "Get all" {
  output=$(./bin/noms-api get all)

  [ "$json_all" == "$output" ]
}

@test "Get groups" {
  output=$(./bin/noms-api get groups)

  json_groups=$(echo $json_all | jq -cS .groups)
  [ "$json_groups" == "$output" ]
}

@test "Get hosts" {
  output=$(./bin/noms-api get hosts)

  json_hosts=$(echo $json_all | jq -cS .hosts)
  [ "$json_hosts" == "$output" ]
}

@test "Get group1" {
  output=$(./bin/noms-api get hosts)

  json_group1=$(echo $json_all | jq -cS .groups.group1)
  [ "$json_group1" == "$output" ]
}

@test "Add host1" {
  ./bin/noms-api add hosts host1

  output=$(./bin/noms-api get hosts host1)

  json_host1=$(echo $json_all | jq -cS .hosts.host1)
  [ "$json_host1" == "$output" ]
}
