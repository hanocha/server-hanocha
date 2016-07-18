#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script 'install ruby with rbenv' do
  interpreter 'bash'
  code <<-EOS
    sudo -u hanocha /home/hanocha/.rbenv/bin/rbenv install 2.3.1
  EOS
  not_if %Q{sudo test -d /home/hanocha/.rbenv/versions/2.3.1}, environment: { 'HOME' => "/home/hanocha" }
end
