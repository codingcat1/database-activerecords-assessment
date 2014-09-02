class Competitor < ActiveRecord::Base
  belongs_to :division

  has_many :competitions
  has_many :games, :through => :competitions

  validates :name, :presence => true
end
