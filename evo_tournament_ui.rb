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
    puts "*** GAMETIME menu ***"
    puts "Press (gg) to assign a Game to a Competitor.\n\n"
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
    when 'gg'
      assign_game
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

def add_division
  puts "*** ADD A DIVISION *** \n"
  puts "Enter the type of a Division you would like to add:"
  division_name = gets.chomp
  new_division = Division.new(:name => division_name)
  if new_division.save
    puts "#{division_name.upcase} has been added to the list of Divisions."
    sleep(2)
  else
    puts "Not a valid Division name. please try again. \n"
    new_division.errors.full_messages.each { |message| puts message }
    sleep(2)
  end
end

def add_competitor
  puts "*** ADD A COMPETITOR ***\n"
  puts "Please choose a Division to add a Competitor to:"
  Division.all.each do |division|
    puts "#{division.name}"
  end
  puts "\n"
  division_input = gets.chomp
  add_to_division = Division.find_by(:name => division_input)
  puts "Enter the name of a Competitor that you would like to add to #{division_input.upcase}:\n"
  competitor_name = gets.chomp
  new_competitor = Competitor.new(:name => competitor_name)
  new_competitor.update(:division_id => add_to_division.id)
  if new_competitor.save
    puts "\n#{competitor_name.upcase} has been added to #{division_input.upcase}."
    sleep(2.5)
  else
    puts "Not a valid Competitor name. Please try again. \n"
    new_competitor.errors.full_messages.each { |message| puts message }
    sleep (2)
    system 'clear'
    add_competitor
  end
end

def add_game
  puts "*** ADD A GAME *** \n"
  puts "Enter the name of a Game to be added to the Evo Tournament:\n"
  game_name = gets.chomp
  new_game = Game.new(:name => game_name)
  if new_game.save
    puts "\n#{game_name.upcase} has been added to the list of Games."
    sleep(2.5)
  else
    puts "Not a valid Game name. Please try again. \n"
    new_givision.errors.full_messages.each { |message| puts message }
    sleep(2)
  end
end


menu
