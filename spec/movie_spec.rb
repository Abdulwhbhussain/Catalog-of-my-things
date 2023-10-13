require_relative '../classes/movie'
require 'rspec'

describe Movie do
  before(:each) do
    @movie = 
      Movie.new(
        publish_date: Date.new(2000, 1, 1),
        archived: true,
        silent: true
      )
  end

  describe '#initialize' do
    it 'creates a new Movie object' do
      expect(@movie).to be_an_instance_of Movie
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@movie.to_json).to be_a String
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if silent is true' do
      expect(@movie.send(:can_be_archived?)).to be true
    end
  end
end
