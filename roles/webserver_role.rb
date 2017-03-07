name "webserver_role"
description "apache web server role"
#run_list "recipe[security]","recipe[apaache]", "recipe[localusers]"
run_list "recipe[apaache]","role[base_role]"
