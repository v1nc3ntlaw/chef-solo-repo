class Solo < Thor
  default_task :json

  desc "json FILE [OPTIONS]", "run chef-solo using the json FILE and extra chef-solo OPTIONS"
  def json(file, *args)
    config_file = File.expand_path('../../solo.rb', __FILE__)
    system 'bundle', 'exec', 'chef-solo', '-c', config_file, '-j', file, *args
  end
end
