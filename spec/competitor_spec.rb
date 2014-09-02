require 'spec_helper'

describe Competitor do
  it { should belong_to :division}

  it { should have_many :competitions }
  it { should have_many :games }

  it 'validates the presence of a name' do
    competitor = Competitor.new ({:name => ''})
    expect(competitor.save).to eq false
  end
end
