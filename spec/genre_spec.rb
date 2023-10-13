require_relative '../classes/genre.rb'
require 'rspec'

describe Genre do
  before(:each) do
    @genre = Genre.new(name: 'Horror')
  end

  describe '#initialize' do
    it 'creates a new Genre object' do
      expect(@genre).to be_an_instance_of Genre
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('Movie')
      allow(item).to receive(:genre=)
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@genre.to_json).to be_a String
    end
  end
end