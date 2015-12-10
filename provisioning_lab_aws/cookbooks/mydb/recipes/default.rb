#
# Cookbook Name:: mydb
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#

mysql_service 'mydb' do
    bind_address '0.0.0.0'
    port '3306'
    version '5.6'
    initial_root_password 'icarus123'
    action [:create, :start]
end

cookbook_file '/tmp/my.sql' do
    source 'my.sql'
end

bash 'execute_sql' do
    code <<-EOH
    mysql -h 127.0.0.1 --user=root --password="icarus123" --execute="source /tmp/my.sql;CREATE USER 'mysite'@'%' IDENTIFIED BY 'icarus123';GRANT ALL PRIVILEGES ON mysite.* TO mysite@'%' IDENTIFIED BY 'icarus123';"
    touch /tmp/executed
    EOH
    not_if { ::File.exists?('/tmp/executed') }
end
