class Division < ActiveRecord::Base
  has_many :competitors

  validates :name, :presence => true
end
