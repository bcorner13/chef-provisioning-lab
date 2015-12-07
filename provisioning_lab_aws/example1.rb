require 'chef/provisioning'

with_driver 'aws'


machine 'web1' do
    recipe 'apache'
end
