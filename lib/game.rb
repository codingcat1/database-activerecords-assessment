class Game < ActiveRecord::Base
  has_many :events
  has_many :competitors, :through => :events

  validates :name, :presence => true

  before_save :titlecase_name

private

  def titlecase_name
    self.name = self.name.titlecase
  end
end
