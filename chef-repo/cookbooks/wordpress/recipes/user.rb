group 'nginx'

user 'nginx' do
  group 'nginx'
  system true
  shell '/bin/bash'
end