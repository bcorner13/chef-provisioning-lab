# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "erick_ramirez"
client_key               "#{current_dir}/erick_ramirez.pem"
validation_client_name   "my-chef-class-validator"
validation_key           "#{current_dir}/my-chef-class-validator.pem"
chef_server_url          "https://api.chef.io/organizations/my-chef-class"
cookbook_path            ["#{current_dir}/../cookbooks"]
private_keys             'provisioning_lab' => "#{current_dir}/keys/provisioning_lab.pem"