require_relative '../classes/capitalize_decorator'
require_relative '../classes/person'
require 'rspec'

describe CapitalizeDecorator do
  describe 'Capitalize_decorator #correct_name method' do
    it 'should return the capitalized string' do
      nameable = Person.new(22, 'testNameableName')
      @capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(@capitalize_decorator.correct_name).to eq('Testnameablename')
    end

    it 'should return the capitalized string' do
      nameable = Person.new(22, 'ABABABABAB')
      @capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(@capitalize_decorator.correct_name).to eq('Ababababab')
    end

    it 'should return the capitalized string' do
      nameable = Person.new(22, '')
      @capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(@capitalize_decorator.correct_name).to eq('')
    end
  end
end
