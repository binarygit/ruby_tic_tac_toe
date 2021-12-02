#!/usr/bin/ruby

module Save
  def save
    puts "\n If there are any save game files they will be listed below: \n\n"
    display_saved_files if Dir.exist?('saved_games')
    puts "\n If you would like to create a new save file or overwrite one, write its name "
    print "\n Enter file name or number: "
    file_name = gets.chomp
    serialize(file_name)
  end

  def display_saved_files
    Dir.children('saved_games').each_with_index { |file, index| puts " #{'-'} #{file}" } 
  end

  def serialize(file_name)
    file_name = 'saved_games/' + file_name
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    File.open(file_name, 'w') do |file|
      Marshal.dump(obj, file)
    end
  end
end
