require './lib/competitor'
require './lib/division'
require './lib/game'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  system 'clear'
  puts "*** WELCOME TO THE DATABASE FOR EVO ***"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press (1) to enter the Divisions menu"
    puts "Press (2) to enter the Competitors menu"
    puts "Press (3) to enter the Games menu"
    puts "Press (4) to EXIT"
    choice = gets.chomp
    case choice
    when '1'
      divisions_menu
    when '2'
      competitors_menu
    when '3'
      games_menu
    when 'x'
      puts "OK BYE"
      sleep(1)
      system 'clear'
    else
      puts 'Sorry, not a valid entry'
    end
  end
end
