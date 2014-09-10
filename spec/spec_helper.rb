require 'active_record'
require 'rspec'
require 'pg'
require 'shoulda-matchers'

require 'division'
require 'competitor'
require 'game'
require 'event'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do | config |
  config.after(:each) do
    Division.all.each { |division| division.destroy }
    Competitor.all.each { |competitor| competitor.destroy}
    Game.all.each { |game| game.destroy }
    Event.all.each { |event| event.destroy}
  end
end
