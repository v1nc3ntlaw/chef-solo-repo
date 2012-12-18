#
# Cookbook Name:: hello-world
# Recipe:: default
#

# See list of built-in resources: http://wiki.opscode.com/display/chef/Resources
#
# One resource provides a DEL command.
#
# Cookbook also can provide extra resources and providers. Providers are
# resources implementations for different platform. For example, `package`
# resource has providers based on `apt`, `yum` and etc.
#

# The code are executed on the server you want to configure.
#
# Node attributes can be specified by json file when running `chef-solo`, or
# are fetched from chef server when running `chef-client`.
#
# Cookbook can provide default attributes.
#
# Ohai runs detection code and will set automatic attributes, which have the
# highest precedence.
#
# See http://wiki.opscode.com/display/chef/Attributes

puts "Hello #{node[:hello_world][:name]}, from #{node[:hostname]}"

template '/tmp/hello-world.txt' do
  # variables keys can be accessed as instance variables in erb template
  variables :name => node[:hello_world][:name], :hostname => node[:hostname]
end

puts "A copy of the greet is saved in /tmp/hello-world.txt"

