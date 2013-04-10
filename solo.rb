top_dir = File.dirname(File.expand_path(__FILE__))

node_name 'solo'
cache_type 'BasicFile'
cache_options :path => File.join(top_dir, '.chef/solo/cache/checksums')
file_cache_path        File.join(top_dir, '.chef/solo/cache/files')
file_backup_path       File.join(top_dir, '.chef/solo/cache/backup')
cookbook_path          File.join(top_dir, 'cookbooks')
data_bag_path          File.join(top_dir, 'data_bags')
role_path              File.join(top_dir, 'roles')
client_key             File.join(top_dir, '.chef/insecure_client_key.pem')
