class Competitor < ActiveRecord::Base
  belongs_to :division

  has_many :events
  has_many :games, :through => :events

  validates :name, :presence => true
end
