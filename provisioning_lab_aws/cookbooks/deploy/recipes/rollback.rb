#
# Cookbook Name:: deploy2
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#
#

%w(httpd git).each do |sw|
    package "#{sw}"
end


deploy_revision '/var/www/html' do
    repo 'git://github.com/erickardus/mysite.git'
    symlink_before_migrate({})
    purge_before_symlink ['.git']
    create_dirs_before_symlink []
    symlinks(
        "log" => "log"
    )
    action :rollback
end
