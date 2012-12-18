chef-solo-repo
==============

A fork of [chef-repo](https://github.com/opscode/chef-repo) for
[chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo).

## Get Started ##

Hello world

    bundle install
    bundle exec thor solo:json json/hello-world.json

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
