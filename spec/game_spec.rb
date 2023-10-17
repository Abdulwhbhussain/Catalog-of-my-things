require_relative '../classes/game'
require 'rspec'

describe Game do
  before(:each) do
    @game =
      Game.new(
        publish_date: Date.new(2000, 1, 1),
        archived: true,
        multiplayer: true,
        last_played_at: Date.new(2012, 1, 1)
      )
  end

  describe '#initialize' do
    it 'creates a new Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@game.to_json).to be_a String
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if multiplayer is true' do
      expect(@game.send(:can_be_archived?)).to be true
    end
  end
end
