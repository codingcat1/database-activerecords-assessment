require 'spec_helper'

describe Game do
  it { should have_many :events }
  it { should have_many :competitors }

  it 'validates the presence of a name' do
    game = Game.new ({:name => ''})
    expect(game.save).to eq false
  end
end
