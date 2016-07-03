#
# Cookbook Name:: ruby-build
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/home/hanocha/.rbenv/plugins' do
  group 'hanocha'
  owner 'hanocha'
  mode '0755'
  action :create
end

git '/home/hanocha/.rbenv/plugins/ruby-build' do
  user 'hanocha'
  group 'hanocha'
  repository 'git://github.com/rbenv/ruby-build.git'
  revision 'master'
end
