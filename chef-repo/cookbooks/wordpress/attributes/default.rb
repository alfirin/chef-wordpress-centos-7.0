# Maria DB
node.default['mariadb']['use_default_repository'] = true
node.default['mariadb']['server_root_password'] = 'admin'

# Database
# Connection
node.default['wordpress']['database']['host'] = '127.0.0.1'
node.default['wordpress']['database']['root']['username'] = 'root'
node.default['wordpress']['database']['root']['password'] = 'admin'

# Base
node.default['wordpress']['database']['wordpress']['db_name'] = 'wordpress'
node.default['wordpress']['database']['wordpress']['username'] = 'wp-user'
node.default['wordpress']['database']['wordpress']['password'] = 'wp-pass'

# web server
node.default['wordpress']['webserver']['host'] = 'localhost'