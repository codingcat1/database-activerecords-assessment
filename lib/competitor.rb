class Competitor < ActiveRecord::Base
  belongs_to :division

  has_many :events
  has_many :games, :through => :events

  validates :name, :presence => true

  scope :practice_id, -> { where(division_id: '4')}

  before_save :titlecase_name

private

  def titlecase_name
    self.name = self.name.titlecase
  end
end
