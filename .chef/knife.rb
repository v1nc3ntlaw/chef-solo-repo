dir = File.dirname(File.expand_path(__FILE__))
top_dir = File.dirname(dir)

log_level :info
log_location STDOUT
node_name 'solo'
cache_type 'BasicFile'
cache_options :path => File.join(dir,     'solo/checksums')
file_cache_path        File.join(dir,     'solo/files')
file_backup_path       File.join(dir,     'solo/backup')
cookbook_path        [ File.join(top_dir, 'cookbooks') ]
data_bag_path        [ File.join(top_dir, 'data_bags') ]
role_path            [ File.join(top_dir, 'roles') ]
client_key             File.join(dir,     'insecure_client_key.pem')

# configurations for connecting chef-server
#
# validation_client_name 'chef-validator'
# validation_key File.join(dir, 'validation.pem')
# chef_server_url 'http://localhost:4000'
