#
# Cookbook Name:: chef-solo-repo
# Recipe:: default
#

execute "apt-get update"
package "ruby1.9.3"
package "build-essential"
execute "gem install bundler" do
  not_if "which bundle"
end
