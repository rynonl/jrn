require 'etc'
require 'file'

Jrn::Setup = Struct.new do
  def start
    user_dir = Etc.getpwuid.dir
    puts user_dir

    config_path = "#{user_dir}/.jrn"

    unless File.file?(config_path)
      puts "Jrn is running for the first time"
      File.open(config_path, 'w') { |f| f.write('# jrn') }
    end
  end
end
