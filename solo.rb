top_dir = File.dirname(File.expand_path(__FILE__))

node_name 'solo'
file_cache_path File.join(top_dir, '.chef/solo/cache')
file_backup_path File.join(top_dir, '.chef/solo/backup')
cookbook_path File.join(top_dir, 'cookbooks')
role_path File.join(top_dir, 'roles')
client_key File.join(top_dir, '.chef/insecure_client_key.pem')
