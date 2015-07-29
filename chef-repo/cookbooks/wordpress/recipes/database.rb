
include_recipe 'mariadb::default'

#cookbook_file '/tmp/mysql-community-release-el7-5.noarch.rpm' do
#  source 'mysql-community-release-el7-5.noarch.rpm'
#  owner 'root'
#  group 'root'
#  mode '0600'
#end

#yum_package 'mysql' do
#  source                     '/tmp/mysql-community-release-el7-5.noarch.rpm'
#end

#yum_package 'mysql-community-common' do
#  source                     '/tmp/mysql-community-release-el7-5.noarch.rpm'
#end

#yum_repository 'mysql-community-common' do
#  baseurl "http://dev.zenoss.com/yum/stable/"
#  gpgkey 'http://dev.zenoss.com/yum/RPM-GPG-KEY-zenoss'
#  action :create
#end

mysql2_chef_gem 'default' do
  provider Chef::Provider::Mysql2ChefGem::Mariadb
  action :install
end

mysql_connection_info = {:host     => node['wordpress']['database']['host'],
                         :username => node['wordpress']['database']['root']['username'],
                         :password => node['wordpress']['database']['root']['password']}

mysql_database node['wordpress']['database']['wordpress']['db_name'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['wordpress']['database']['wordpress']['username'] do
  connection mysql_connection_info
  password node['wordpress']['database']['wordpress']['password']
  database_name node['wordpress']['database']['wordpress']['db_name']
  host node['wordpress']['database']['host']
  action [:create, :grant]
end