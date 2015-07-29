# PHP-fpm

include_recipe 'php-fpm::default'

node.set['php-fpm']['user'] = 'nginx'
node.set['php-fpm']['group'] = 'nginx'

php_fpm_pool 'wordpress' do
  user 'nginx'
  group 'nginx'
  listen '/var/run/php-fpm-wordpress.sock'
  'listen.owner' 'nginx'
  'listen.group' 'nginx'
  php_options 'php_admin_flag[log_errors]' => 'on', 'php_admin_value[memory_limit]' => '32M'
end

php_fpm_pool 'www' do
  enable false
end

yum_package 'php-mysql' do
  action :install
end