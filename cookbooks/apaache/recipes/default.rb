#
# Cookbook Name:: apaache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if node["platform"] == "ubuntu"
	execute "apt-get update -y" do 
	end
end


package "apache" do
	package_name node["apaache"]["package"]
	action :install
end

node["apaache"]["sites"].each do |sitename,data|
	document_root = "/content/sites/#{sitename}"

	directory document_root do
		mode "0755"
		recursive true
	end

if node["platform"] == "centos2"
	config_location = "/etc/httpd/conf.d/#{sitename}.conf"
elsif node["platform"] == "ubuntu"
	config_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
end


	template config_location do
		source "vhosts.erb"	
		mode "0644"
		variables(
			:document_root => document_root,
			:port => data["port"],
			:domain => data["domain"]
		)
		notifies :restart, "service[apache]"
	end

	template "#{document_root}/index.html"	do
		source "index.html.erb"
		mode 0644
		variables(
			:site_title => data["site_title"],
			:comingsoon => "Coming Soon!"

		)
	end
end

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[apache]"
end


execute "rm /etc/httpd/conf.d/README" do
        only_if do
                File.exist?("/etc/httpd/conf.d/README")
        end
        notifies :restart, "service[apache]"
end



service "apache" do
	service_name node["apaache"]["package"]
	action [:enable,:start]
end


#include_recipe "php::default"

