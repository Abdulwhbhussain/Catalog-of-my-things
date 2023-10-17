require_relative '../classes/book'
require 'rspec'

describe Book do
  before(:each) do
    @book =
      Book.new(
        publish_date: Date.new(2000, 1, 1),
        archived: true,
        publisher: 'Publisher',
        cover_state: 'bad'
      )
  end

  describe '#initialize' do
    it 'creates a new Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@book.to_json).to be_a String
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if cover_state is bad' do
      expect(@book.send(:can_be_archived?)).to be true
    end
  end
end
