
directory '/var/www/wordpress' do
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
  recursive true
end

tar_extract 'https://wordpress.org/wordpress-4.2.3.tar.gz' do
  target_dir '/var/www'
  creates '/var/www/wordpress/index.php'
  user 'nginx'
  group 'nginx'
end

template "/var/www/wordpress/wp-config.php" do
  source "wp-config.php.erb"
  owner  "nginx"
  group  "nginx"
  mode   "0644"
end

#remote_file '/var/www/wordpress-4.2.3.tar.gz' do
#  source 'https://wordpress.org/wordpress-4.2.3.tar.gz'
#  owner 'nginx'
#  group 'nginx'
#  action :create
#end