require 'active_record'

require './lib/competitor'
require './lib/division'
require './lib/game'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])


def menu
  choice = nil
  until choice == 'x'
    system 'clear'
    puts "*** WELCOME TO THE DATABASE FOR EVO ***\n\n"
    puts "*** DIVISIONS MENU ***"
    puts "Press (1) to add a Division"
    puts "Press (2) to view existing Divisions\n\n"
    puts "*** COMPETITORS MENU ***"
    puts "Press (3) to add a Competitor"
    puts "Press (4) to view all Competitors\n\n"
    puts "*** GAMES MENU ***"
    puts "Press (5) to add a Game"
    puts "Press (6) to view all Games\n\n"
    puts "Press (x) to EXIT"
    choice = gets.chomp
    case choice
    when '1'
      add_division
    when '2'
      view_divisions
    when '3'
      add_competitor
    when '4'
      view_competitors
    when '5'
      add_game
    when '6'
      view_games
    when 'x'
      puts "OK BYE"
      sleep(1)
      system 'clear'
    else
      puts 'Sorry, not a valid entry'
      sleep(1)
    end
  end
end


menu
