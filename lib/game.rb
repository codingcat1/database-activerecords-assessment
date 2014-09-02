class Game < ActiveRecord::Base
  has_many :competitions
  has_many :competitors, :through => :competitions

  validates :name, :presence => true
end
