user 'vagrant'
host '127.0.0.1'
port 2222
ssh_options(:keys => '~/.vagrant.d/insecure_private_key')

node.set[:name] = 'localhost-sample'

run_list ['recipe[hello-world]']
