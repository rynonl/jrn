require 'etc'

module Jrn
  Setup = Struct.new(:_) do
    def start
      user_dir = Etc.getpwuid.dir
      jrn_dir = "#{user_dir}/.jrn/"
      config_file = "#{jrn_dir}/.config"

      unless File.directory?(jrn_dir)
        puts "Jrn is running for the first time"

        Dir.mkdir(jrn_dir)
        File.open(config_file, 'w') { |f| f.write('# jrn') }
      end
    end
  end
end
