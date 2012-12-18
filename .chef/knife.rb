dir = File.dirname(File.expand_path(__FILE__))
top_dir = File.dirname(dir)

log_level :info
log_location STDOUT
node_name 'solo'
client_key File.join(dir, 'insecure_client_key.pem')
cache_type 'BasicFile'
cache_options :path => File.join(dir, 'checksums')
cookbook_path [ File.join(top_dir, 'cookbooks') ]

# configurations for connecting chef-server
#
# validation_client_name 'chef-validator'
# validation_key File.join(dir, 'validation.pem')
# chef_server_url 'http://localhost:4000'
