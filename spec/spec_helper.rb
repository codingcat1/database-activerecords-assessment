require 'active_record'
require 'rspec'
require 'pg'
require 'shoulda-matchers'

require 'division'
require 'competitor'
require 'game'
require 'competition'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do | config |
  config.after(:each) do
    Division.all.each { |division| division.destroy }
    Competitor.all.each { |competitor| competitor.destroy}
    Game.all.each { |game| game.destroy }
    Competition.all.each { |competition| competition.destroy}
  end
end
