require 'chef/provisioning'
with_driver 'aws'

machine 'webx' do
    machine_options bootstrap_options: { key_name: 'provisioning_lab' }
end
