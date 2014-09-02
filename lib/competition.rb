class Competition < ActiveRecord::Base
  belongs_to :competitor
  belongs_to :game
end
