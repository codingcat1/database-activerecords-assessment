class Division < ActiveRecord::Base
  has_many :competitors

  validates :name, :presence => true

  before_save :titlecase_name

private

  def titlecase_name
    self.name = self.name.titlecase
  end
end
