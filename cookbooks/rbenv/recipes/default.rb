#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git '/home/hanocha/.rbenv' do
  user 'hanocha'
  group 'hanocha'
  repository 'git://github.com/sstephenson/rbenv.git'
  revision 'master'
end

script 'init and install rbenv' do
  interpreter 'bash'
  user 'hanocha'
  group 'hanocha'
  environment "HOME" => "/home/hanocha"
  code <<-EOS
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bash_profile
    $HOME/.rbenv/bin/rbenv init
    echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
  EOS
  not_if %Q{grep '.rbenv/bin' $HOME/.bash_profile}, environment: { 'HOME' => "/home/hanocha" }
end
