#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#

package 'Install Apache' do
    case node[:platform]
    when 'redhat', 'centos', 'amazon'
        package_name 'httpd'
    when 'ubuntu', 'debian'
        package_name 'apache2'
    end
end

file '/var/www/html/index.html' do
    content '<HTML><BODY>Hello Class!</BODY></HTML>'
end

service 'apache_start' do
    case node[:platform]
    when 'redhat', 'centos', 'amazon'
        service_name 'httpd'
    when 'ubuntu', 'debian'
        service_name 'apache2'
    end
    action [:enable, :start]
end
