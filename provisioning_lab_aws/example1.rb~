require 'chef/provisioning'

with_driver 'aws'

with_machine_options({
    bootstrap_options: {
        image_id: "ami-60b6c60a",
        instance_type: "t2.micro",
        ssh_username: "ec2user",
    }
})

machine 'web1' do
    recipe 'apache'
end
