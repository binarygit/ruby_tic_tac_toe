#!/usr/bin/ruby
require 'pry-byebug'

module Load
  def load
    puts " Your saved files are: \n\n"
    Dir.children('saved_games').each_with_index { |file, index| puts " #{'-'} #{file}" }
    file_name = get_file_name
    unserialize(file_name)
  end

  def get_file_name
    loop do
      print "\n Which file would you like to load? "
      file_name = gets.chomp
      (return file_name) if exist?(file_name)

      puts " Please enter the file name correctly".red
    end
  end

  def exist?(file)
    Dir.children('saved_games').each { |f| return true if f == file }
    return false
  end

  def unserialize(file_name)
    file_name = 'saved_games/' + file_name
    File.open(file_name) do |file|
      obj = Marshal.load(file)
      obj.keys.each do |key|
        instance_variable_set(key, obj[key])
      end
    end
  end
end
