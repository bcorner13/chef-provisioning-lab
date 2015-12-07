require 'chef/provisioning'
with_driver 'aws'

with_machine_options({
                     ssh_username: 'ec2-user',
                     bootstrap_options: {
                       key_name: 'provisioning_lab',
                       image_id: 'ami-60b6c60a',
                       instance_type: 't2.micro',
                     },
})


machine 'web1' do
    recipe 'apache'
end
