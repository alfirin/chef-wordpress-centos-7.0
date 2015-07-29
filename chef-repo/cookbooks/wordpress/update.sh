berks update
berks upload
knife bootstrap '172.28.128.6' --bootstrap-version '12.4.1' --ssh-user 'vagrant' --ssh-password 'vagrant' --sudo --use-sudo-password --node-name wordpress --run-list 'recipe[wordpress]'