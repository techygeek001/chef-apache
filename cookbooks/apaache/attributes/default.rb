default["apaache"]["sites"]["kvamshikanth2"] = { "site_title" => "Vamshi2's site coming soon...", "port" => 80, "domain" => "kvamshikanth2.mylabserver.com" }
default["apaache"]["sites"]["kvamshikanth2b"] = { "site_title" => "Vamshi2b's site coming soon.. !!!!", "port" => 80, "domain" => "kvamshikanth2b.mylabserver.com" }
default["apaache"]["sites"]["kvamshikanth5"] = {"site_title" => "Vamshi5's Site coming soon..", "port" => 80, "domain" => "kvamshikanth5.mylabserver.com" }

default["author"]["name"] = "Vamshi"

case node["platform"] 
when "centos"
	default["apaache"]["package"] = "httpd"
when "ubuntu"
	default["apaache"]["package"] = "apache2"
end






