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

script 'add rbenv path to .bash_profile' do
  interpreter 'bash'
  user 'hanocha'
  group 'hanocha'
  environment "HOME" => "/home/hanocha"
  code %Q{echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bash_profile}
  not_if %Q{grep '.rbenv/bin' $HOME/.bash_profile}, environment: { 'HOME' => "/home/hanocha" }
end

script 'exec "rbenv init"' do
  interpreter 'bash'
  user 'hanocha'
  group 'hanocha'
  environment "HOME" => "/home/hanocha"
  code %Q{$HOME/.rbenv/bin/rbenv init}
  returns 1
end

script 'add rbenv init command to .bash_profile' do
  interpreter 'bash'
  user 'hanocha'
  group 'hanocha'
  environment "HOME" => "/home/hanocha"
  code %Q{echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile}
  not_if %Q{grep 'eval "$(rbenv init -)"' $HOME/.bash_profile}, environment: { 'HOME' => "/home/hanocha" }
end
