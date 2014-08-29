require 'spec_helper'

describe Game do
  it 'validates the presence of a name' do
    game = Game.new ({:name => ''})
    expect(game.save).to eq false
  end
end
