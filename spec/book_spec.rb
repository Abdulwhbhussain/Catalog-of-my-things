require_relative '../classes/book'
require 'rspec'

describe Book do
  before(:each) do
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
  end

  describe '#initialize' do
    it 'should have a title' do
      expect(@book.title).to eq('The Great Gatsby')
    end

    it 'should have an author' do
      expect(@book.author).to eq('F. Scott Fitzgerald')
    end

    it 'should have an empty rentals array' do
      expect(@book.rentals).to eq([])
    end
  end

  describe '#to_json' do
    it 'should return a JSON string' do
      expect(@book.to_json).to eq('{"title":"The Great Gatsby","author":"F. Scott Fitzgerald"}')
    end
  end
end
