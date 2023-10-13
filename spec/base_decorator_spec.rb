require_relative '../classes/base_decorator'
require_relative '../classes/nameable'
require_relative '../classes/person'
require 'rspec'

describe BaseDecorator do
  before(:each) do
    @nameable = Nameable.new
    @base_decorator = BaseDecorator.new(@nameable)
  end

  describe '#initialize' do
    it 'should check for nameable' do
      expect(@base_decorator.nameable).to eq(@nameable)
    end
  end

  describe '#correct_name' do
    it 'should raise an error' do
      expect { @base_decorator.correct_name }.to raise_error(NotImplementedError)
    end
  end

  describe '#correct_name method with a parameter(person)' do
    it 'should return the name from the person object' do
      testing_nameable = Person.new(22, 'testNameableName')
      testing = BaseDecorator.new(testing_nameable)
      expect(testing.correct_name).to eq('testNameableName')
    end
  end
end
