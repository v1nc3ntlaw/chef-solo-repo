http://wiki.opscode.com/display/chef/Templates

Within a Cookbook's template directory, you might find a directory structure like this:

-   templates
    -   host-foo.example.com
    -   ubuntu-8.04
    -   ubuntu
    -   default

For a node with FQDN of foo.example.com and the sudoers.erb resource above, we would match:

-   host-foo.example.com/sudoers.erb
-   ubuntu-8.04/sudoers.erb
-   ubuntu/sudoers.erb
-   default/sudoers.erb

In that order.
