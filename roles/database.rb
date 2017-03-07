name "database"
description "Mysql role for all db servers"
run_list "recipe[mysql]","role[base_role]"
