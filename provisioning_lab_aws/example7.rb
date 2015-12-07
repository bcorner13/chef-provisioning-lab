require 'chef/provisioning'
require 'chef/provisioning/aws_driver'
with_driver 'aws'


my_vpc = aws_vpc 'myapp-vpc' do
    cidr_block '10.0.0.0/16'
    main_routes '0.0.0.0/0' => :internet_gateway
    internet_gateway true
end

my_sg = aws_security_group 'myapp-sg' do
    vpc lazy { my_vpc.aws_object_id }
    inbound_rules '0.0.0.0/0' => [ 22, 80 ]
end

my_subnet = aws_subnet 'myapp-public1' do
    vpc lazy { my_vpc.aws_object_id }
    cidr_block '10.0.1.0/24'
    availability_zone 'us-east-1a'
    map_public_ip_on_launch true
end

machine 'webserver' do
  machine_options(
    lazy do
      {
        ssh_username: 'ec2-user',
        bootstrap_options: {
          key_name: 'provisioning_lab',
          image_id: 'ami-60b6c60a',
          instance_type: 't2.micro',
          subnet_id: my_subnet.aws_object.id,
          security_group_ids: [my_sg.aws_object.id]
        }
      }
    end
  )
  recipe 'apache'
end

