# Nginx
include_recipe 'nginx::default'

node.set["nginx"]["default_site_enabled"] = false

domain_name = node['wordpress']['webserver']['host']

template "#{node["nginx"]["dir"]}/sites-available/wordpress" do
  source "nginx-wordpress.erb"
  owner  "nginx"
  group  "nginx"
  mode   "0644"
  variables(:domain_name => domain_name)
end

nginx_site "default" do
  enable false
end

nginx_site "wordpress" do
  enable true
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :reload ]
end

#template "/var/www/index.php" do
#  source "index.php.erb"
#  owner  "nginx"
#  group  "nginx"
#  mode   "0755"
#end