require_relative '../classes/label'
require 'rspec'

describe Label do
  before(:each) do
    @label =
      Label.new(
        title: 'Warner Bros.',
        color: 'Blue'
      )
  end

  describe '#initialize' do
    it 'creates a new Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('Movie')
      allow(item).to receive(:label=)
      @label.add_item(item)
      expect(@label.items).to include(item)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@label.to_json).to be_a String
    end
  end
end
