require 'chef/provisioning'

with_driver 'aws'

machine 'web01' do
    recipe 'httpd'
end
