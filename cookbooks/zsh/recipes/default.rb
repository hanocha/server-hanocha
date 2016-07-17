#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'zsh'

script 'install oh-my-zsh' do
  interpreter 'bash'
  user 'hanocha'
  group 'hanocha'
  environment "HOME" => "/home/hanocha"
  code <<-EOS
    sudo -u hanocha sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  EOS
  not_if %Q{chsh -l | grep zsh}, environment: { 'HOME' => "/home/hanocha" }
end
