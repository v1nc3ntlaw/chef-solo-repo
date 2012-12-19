chef-solo-repo
==============

A fork of [chef-repo](https://github.com/opscode/chef-repo) for
[chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo).

Fork it and add your own cookbooks and server configurations.

## Get Started ##

Hello world

    bundle install
    bundle exec thor solo:json json/hello-world.json

Or use `chef-solo` directly

    bundle exec chef-solo -c solo.rb -j json/hello-world.json

## Test using Vagrant ##

Cookbooks may modify the system, so test them in virtual
machine. `Vagrantfile` is already provided in this repository, just install
[VirtualBox](https://www.virtualbox.org/) and setup a virtual machine using
[vagrant](http://vagrantup.com)

    bundle exec vagrant up
    bundle exec vagrant ssh

The last command only prints out SSH login information on Windows, use SSH
client such as PuTTY to connect manually.

## Capistrano ##

Usually the process to use `chef-solo` is

-    Define server attributes using a JSON file
-    Upload this repository to server
-    Install cookbooks dependencies
-    Run `chef-solo` on the server against the JSON file

Capistrano is integrated to automate the process.

-    Define server attributes using ruby DSL, the DSL also define user, host,
     port and ssh options, so capistrano know how to establish the SSH
     connection.
-    Run `cap deploy` to upload repository to server.
-    Capistrano uses bundler to install dependencies
-    Capistrano export server ruby DSL definition file into JSON, and run
     `chef-solo` against the JSON file.

The DSL is very simple, and should be placed under directory `servers`.

```ruby
# deploy user for capistrano
user 'vagrant'
# server IP or domain
host '127.0.0.1'
# SSH port for capistrano
port 2222
# SSH options for capistrano
ssh_options(:keys => '~/.vagrant.d/insecure_private_key')

# Use node.set, node.default, node.override methods to configure node
# attributes.
node.set[:name] = 'localhost-sample'

# specify run list
run_list ['recipe[hello-world]']
```

All `cap` remote commands must specify one or multiple server definition files. For
example:

-   setup

        cap deploy:setup servers/server_a.rb [servers/server_b.rb ....]

-   upload repository, run bundle, export JSON and run chef-solo on servers

        cap deploy servers/server_a.rb [servers/server_b.rb ....]

Tips: name servers by pattern (using prefix or suffix), and use glob (for
shell like bash, zsh, csh) to select servers.

    # run on all servers
    cap deploy servers/*
    # run on all servers which definition file starting with db-
    cap deploy servers/db-*.rb

All available servers can be list by

    cap -T servers

or simply:

    ls servers

## Overview ##

Besides functionaries provided by
[chef-repo](https://github.com/opscode/chef-repo), this repository has some
customizations.

### Zero Configuration ###

The repository is ready to go with default configurations and sample
cookbook. Chef default configurations use many system paths, such as `/etc`
and `/var`. Use this repository, you don't need root permission, or go though
config files to tweak all the paths.

### Thor Tasks ###

The repository contains [thor](http://rdoc.info/github/wycats/thor) files for
common tasks. These actions ease the daily usage for chef-solo.

## Configuration ##

Files `.chef/knife.rb` and `solo.rb` setup some default configurations so
`chef-solo` will not use system location such as `/etc` and `/var`.

Key `.chef/insecure_client_key.pem` is created to pass file test when running
`knife` and `chef-solo` commands. If you want to use the key to connect chef
server, DO generate a key yourself.

## Next Steps ##

Read the README file in each of the subdirectories for more information about
what goes in those directories.



