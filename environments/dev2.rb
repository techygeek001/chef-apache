name "dev2"
description "This is second development env"
cookbook "apaache", "= 0.1.5"
override_attributes({
	"author" => {
		"name" => "my new author name"
	}

})


