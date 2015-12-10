#
# Cookbook Name:: deploy2
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#
#


node.default['db']['ipaddress'] = search(:node, 'name:db').first['ec2']['public_ipv4']


%w(httpd git php php-mysql).each do |sw|
    package "#{sw}"
end

cookbook_file '/etc/httpd/conf.d/mysite.conf' do
    source 'mysite.conf'
end

node.default['db']['ipaddress'] = search(:node, 'name:db').first['ec2']['public_ipv4']

service 'httpd' do
    action [:enable, :start]
end

deploy_revision '/var/www/html' do
    repo 'git://github.com/erickardus/mysite.git'
    revision 'HEAD'
    symlink_before_migrate({})
    purge_before_symlink ['.git']
    create_dirs_before_symlink []
    symlinks(
        "log" => "log"
    )
    notifies :restart, 'service[httpd]'
end

template '/var/www/html/current/mysite.php' do
    source 'mysite.php.erb'
end

service 'httpd' do
    action :restart
end

