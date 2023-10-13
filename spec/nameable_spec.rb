require_relative '../classes/nameable'
require 'rspec'

describe Nameable do
  before(:each) do
    @nameable = Nameable.new
  end

  describe '#correct_name' do
    it 'should raise an error' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
