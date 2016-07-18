#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'zsh'

user 'hanocha' do
  action :modify
  shell '/bin/zsh'
end

script 'install oh-my-zsh' do
  user 'hanocha'
  interpreter 'bash'
  environment "HOME" => "/home/hanocha"
  code <<-EOS
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o $HOME/install.sh
    sh $HOME/install.sh
  EOS
  not_if %Q{test -d .oh-my-zsh}, environment: { 'HOME' => "/home/hanocha" }
end