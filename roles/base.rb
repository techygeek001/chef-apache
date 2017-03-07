name "base_role"
description "What needs to be on every single node"
run_list "recipe[security]", "recipe[localusers]"
