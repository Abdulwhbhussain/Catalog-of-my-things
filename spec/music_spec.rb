require_relative '../classes/music'
require 'rspec'

describe Music do
  before(:each) do
    @music =
      Music.new(
        publish_date: Date.new(2000, 1, 1),
        archived: true,
        on_spotify: true
      )
  end

  describe '#initialize' do
    it 'creates a new Music object' do
      expect(@music).to be_an_instance_of Music
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@music.to_json).to be_a String
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if on_spotify is true' do
      expect(@music.send(:can_be_archived?)).to be true
    end
  end
end