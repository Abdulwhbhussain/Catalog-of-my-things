require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/person'
require 'rspec'

describe Rental do
  before(:each) do
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    @person = Person.new(22, 'Unknown', parent_permission: true)
    @person.id = 4
    @rental = Rental.new('2023-10-11', @book, @person)
  end

  describe '#initialize' do
    it 'should check the date' do
      expect(@rental.date).to eq('2023-10-11')
    end

    it 'should check for the book instance' do
      expect(@rental.book).to eq(@book)
    end

    it 'should check for the person instance' do
      expect(@rental.person).to eq(@person)
    end

    it 'should check for the book title' do
      expect(@rental.book.title).to eq('The Great Gatsby')
    end

    it 'should check for the book author' do
      expect(@rental.book.author).to eq('F. Scott Fitzgerald')
    end

    it 'Should check for the age' do
      expect(@rental.person.age).to eq(22)
    end

    it 'Should check for the name' do
      expect(@rental.person.name).to eq('Unknown')
    end

    it 'Should check for the parent permission' do
      expect(@rental.person.parent_permission).to eq(true)
    end
  end
end
