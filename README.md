chef-solo-repo
==============

A fork of [chef-repo](https://github.com/opscode/chef-repo) for
[chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo).

## Get Started ##

Hello world

    bundle install
    bundle exec thor solo:json json/hello-world.json

Or use `chef-solo` directly

    bundle exec chef-solo -c solo.rb -j json/hello-world.json

## Test using Vagrant ##

Because cookbooks may change system configurations, it is better to test in
virtual machine, instead of on the local machine directly. `Vagrantfile` is
already provided in this repository.

    bundle exec vagrant up
    bundle exec vagrant ssh

For Windows, you need to connect to virtual machine using SSH client such as
PuTTY manually.

## Capistrano ##

This repository also has integrated capistrano. 

The dependencies are managed by bundler, add cookbooks' dependencies to
Gemfile.

Servers are defined in directory `servers` using DEL:

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

-   setup

        cap deploy:setup servers/server_a.rb [servers/server_b.rb ....]

-   run chef-solo on servers

        cap deploy servers/server_a.rb [servers/server_b.rb ....]

Both commands can specify one or multiple server definition files. If your
shell support glob (such as bash, zsh, csh), you can run chef-solo on all
servers using:

    cap deploy servers/*

If you name your servers by some pattern, you also can run on some servers by
pattern:

    cap deploy servers/db-*.rb

View all available servers through

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

Read the README file in each of the subdirectories for more information about what goes in those directories.
