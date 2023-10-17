require_relative '../classes/author'
require 'rspec'

describe Author do
  before(:each) do
    @author =
      Author.new(
        first_name: 'Stephen',
        last_name: 'King'
      )
  end

  describe '#initialize' do
    it 'creates a new Author object' do
      expect(subject).to be_an_instance_of Author
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('Book')
      allow(item).to receive(:author=)
      subject.add_item(item)
      expect(subject.items).to include(item)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(subject.to_json).to be_a String
    end
  end
end
