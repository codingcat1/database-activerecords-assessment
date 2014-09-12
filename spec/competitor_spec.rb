require 'spec_helper'

describe Competitor do
  it { should belong_to :division}

  it { should have_many :events }
  it { should have_many :games }

  it 'validates the presence of a name' do
    competitor = Competitor.new ({:name => ''})
    expect(competitor.save).to eq false
  end

  it 'converts the name to titlecase' do
    competitor = Competitor.create(:name => "johnny")
    expect(competitor.name).to eq "Johnny"
  end
end
