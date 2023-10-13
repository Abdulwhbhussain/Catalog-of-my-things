require_relative '../classes/trimmer_decorator'
require_relative '../classes/person'
require 'rspec'

describe TrimmerDecorator do
  describe 'trimmer_decorator #correct_name method' do
    it 'should return the trimmed string as length > 10' do
      nameable = Person.new(22, 'testNameableName')
      @trimmer_decorator = TrimmerDecorator.new(nameable)
      expect(@trimmer_decorator.correct_name).to eq('testNameab')
    end

    it 'should return the string as length = 10' do
      nameable = Person.new(22, 'ABABABABAB')
      @trimmer_decorator = TrimmerDecorator.new(nameable)
      expect(@trimmer_decorator.correct_name).to eq('ABABABABAB')
    end

    it 'should return the string as length < 10' do
      nameable = Person.new(22, 'Tan')
      @trimmer_decorator = TrimmerDecorator.new(nameable)
      expect(@trimmer_decorator.correct_name).to eq('Tan')
    end

    it 'should return the string as length is 0' do
      nameable = Person.new(22, '')
      @trimmer_decorator = TrimmerDecorator.new(nameable)
      expect(@trimmer_decorator.correct_name).to eq('')
    end
  end
end
