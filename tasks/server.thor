require 'chef'

class Chef::Node
  def host(host = nil)
    @host = host || @host
  end
  def user(*args); end
  def port(*args); end
  def ssh_options(*args); end
end

class Server < Thor
  Dir['servers/*.rb'].each do |f|
    node = Chef::Node.new
    node.instance_eval File.read(f)
    host = node.host
    json = node.normal_attrs.to_hash
    json['run_list'] = node.run_list

    desc host, "dump json for #{host} into json/servers/#{host}.json"

    define_method host do
      File.open("json/servers/#{host}.json", 'w') do |out|
        out.write(JSON.dump(json))
      end
    end
  end
end
