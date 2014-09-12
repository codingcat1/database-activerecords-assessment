require 'spec_helper'

describe Game do
  it { should have_many :events }
  it { should have_many :competitors }

  it 'validates the presence of a name' do
    game = Game.new ({:name => ''})
    expect(game.save).to eq false
  end

  it 'converts the name to titlecase' do
    game = Game.create(:name => "street fighter")
    expect(game.name).to eq "Street Fighter"
  end
end
