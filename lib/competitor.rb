class Competitor < ActiveRecord::Base
  belongs_to :division

  validates :name, :presence => true
end
