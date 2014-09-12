require 'active_record'

require './lib/competitor'
require './lib/division'
require './lib/game'
require './lib/event'
require 'date'
require 'pry'

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
    puts "Press (3) to ADD a Competitor"
    puts "Press (4) to DISQUALIFY a Competitor"
    puts "Press (5) to view all Competitors\n\n"
    puts "*** GAMES MENU ***"
    puts "Press (6) to add a Game"
    puts "Press (7) to view all Games"
    puts "Press (8) to view all Games from today\n\n"
    puts "*** GAMETIME menu ***"
    puts "Press (gg) to create an event.\n\n"
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
      mark_disqualified
    when '5'
      view_competitors
    when '6'
      add_game
    when '7'
      view_games
    when '8'
      today_games
    when 'gg'
      create_event
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
  new_division = Division.create(:name => division_name)
  if new_division.save
    puts "#{division_name.upcase} has been added to the list of Divisions."
    sleep(2)
  else
    puts "Not a valid Division name. please try again. \n"
    new_division.errors.full_messages.each { |message| puts message }
    sleep(2)
  end
end

def view_divisions
  puts "\n\n*** ALL CURRENT DIVISIONS ***"
  puts "Press any key to return to the main menu:\n\n"
  Division.all.each do |division|
    puts "#{division.name}"
  end
  gets.chomp
end

def add_competitor
  system 'clear'
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
  new_competitor = Competitor.create(:name => competitor_name, :disqualified => false)
  new_competitor.update(:division_id => add_to_division.id)
  if new_competitor.save
    puts "\n#{competitor_name.upcase} has been added to #{division_input.upcase}."
    sleep(2.5)
  else
    puts "Not a valid Competitor name. Please try again. \n"
    new_competitor.errors.full_messages.each { |message| puts message }
    sleep (2)
  end
end

def mark_disqualified
  system 'clear'
  puts "*** DISQUALIFY A COMPETITOR ***"
  puts "Type the name of a Competitor to be removed from the Tournament:\n\n"
  competitors = Competitor.where(:disqualified => false)
  competitors.each do |competitor|
    puts "NAME: #{competitor.name}, DIVISION: #{competitor.division_id}"
  end
  puts "\n"
  competitor_input = gets.chomp
  loser = Competitor.where(:name => competitor_input).first
  loser.update(:disqualified => true)
  puts "\n #{competitor_input.upcase} has now been DISQUALIFIED"
  sleep(2)
end

def view_competitors
  puts "\n\n*** ALL CURRENT & QUALIFYING COMPETITORS AND THEIR EVENTS ***"
  puts "Press any key to return to the main menu:\n\n"
  competitors = Competitor.where(:disqualified => false)
  competitors.each do |competitor|
    puts "NAME: #{competitor.name}, DIVISION: #{competitor.division_id}"
  end
  gets.chomp
end

def add_game
  puts "*** ADD A GAME *** \n"
  puts "Enter the name of a Game to be added to the Evo Tournament:\n"
  game_name = gets.chomp
  new_game = Game.create(:name => game_name)
  if new_game.save
    puts "\n#{game_name.upcase} has been added to the list of Games."
    sleep(2.5)
  else
    puts "Not a valid Game name. Please try again. \n"
    new_game.errors.full_messages.each { |message| puts message }
    sleep(2)
  end
end

def view_games
  puts "\n\n*** ALL CURRENT GAMES ***"
  puts "Press any key to return to the main menu:\n\n"
  Game.all.each do |game|
    puts "#{game.name}"
  end
  gets.chomp
end

# def today_games
#   puts "\n\n*** TODAY'S GAMES ***"
#   puts "Press any key to return to main menu:\n\n"
#   Game.time.each { |game| puts "#{game.name}"}
#   binding.pry
#   gets.chomp
# end

def create_event
  puts "*** GAME ON *** \n"
  Division.all.each do |division|
    puts "#{division.name}"
  end
  puts "\n\nSelect a Division to see its list of Competitors in order to assign a Game to them.\n"
  division_input = gets.chomp
  puts "\n"
  division = Division.where(:name => division_input).first
  division.competitors.each do |competitor|
    puts "#{competitor.name}"
  end
  puts "\n\nSelect a Competitor to add a Game that they will be competing in:"
  competitor_input = gets.chomp
  puts "\n"
  selected_competitor = Competitor.find_by(:name => competitor_input)
  puts "\n\nEnter the name of a Game to add to #{selected_competitor.name}\n"
  Game.all.each do |game|
    puts "#{game.name}"
  end
  puts "\n"
  game_input = gets.chomp
  selected_game = Game.find_by(:name => game_input)
  puts "\n"
  new_event = Event.create(:competitor_id => selected_competitor.id, :game_id => selected_game.id)
  new_event
  puts "\n#{competitor_input.upcase} is now set to compete in #{game_input.upcase}!!!"
  sleep(2.5)
end


menu
