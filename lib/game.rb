class Game < ActiveRecord::Base
  has_many :events
  has_many :competitors, :through => :events

  validates :name, :presence => true

  scope :time, -> {where(created_at: Time.now..)}
end
