# Update apt
include_recipe 'apt::default'

# User
include_recipe 'wordpress::user'

# Database
include_recipe 'wordpress::database'

# PHP fpm
include_recipe 'wordpress::php-fpm'

# Web server
include_recipe 'wordpress::webserver'

# Web server
include_recipe 'wordpress::wordpress'