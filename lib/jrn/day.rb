require 'os'
require 'time'

module Jrn
  Day = Struct.new(:date) do
    def start
      user_dir = Etc.getpwuid.dir
      jrn_dir = "#{user_dir}/.jrn/"
      day_file = "#{jrn_dir}/#{date}.md"

      is_new_day = !File.exist?(day_file)

      if is_new_day
        # Start new day from template
        File.open(day_file, 'w') do |file|
          file << "####{date}###\n"
          file << "\n"
          file << "#{Time.now.strftime("%I:%M%p")}\n"
          file << "*\s\s"
        end
      else
        # Start new line prompt if needed
        lines = File.read(day_file).split

        if lines.last != "*\s\s"
          File.open(day_file, 'a') do |file|
            file << "\n"
            file << "#{Time.now.strftime("%I:%M%p")}\n"
            file << "*\s\s"
          end
        end
      end

      system("/usr/local/bin/vim \"+ normal G$\" +startinsert #{day_file}")

      # Backup here
    end
  end
end
