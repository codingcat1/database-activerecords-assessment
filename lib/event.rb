class Event < ActiveRecord::Base
  belongs_to :competitor
  belongs_to :game
end
