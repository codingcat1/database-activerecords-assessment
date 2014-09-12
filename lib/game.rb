class Game < ActiveRecord::Base
  has_many :events
  has_many :competitors, :through => :events

  validates :name, :presence => true

  # scope :before_at, -> { where('created_at > ? ': )}
end
