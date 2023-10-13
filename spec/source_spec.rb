require_relative '../classes/source'
require 'rspec'

describe Source do
  before(:each) do
    @source = Source.new(name: 'Friend')
  end

  describe '#initialize' do
    it 'creates a new Genre object' do
      expect(@source).to be_an_instance_of Source
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('MusicAlbum')
      allow(item).to receive(:source=)
      @source.add_item(item)
      expect(@source.items).to include(item)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@source.to_json).to be_a String
    end
  end
end
