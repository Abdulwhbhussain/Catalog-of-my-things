require_relative '../classes/person'
require 'rspec'

describe Person do
  before(:each) do
    @person = Person.new(22)
    @person.id = 3
  end

  describe '#initialize' do
    it 'Should check for the age' do
      expect(@person.age).to eq(22)
    end

    it 'Should check for the name' do
      expect(@person.name).to eq('Unknown')
    end

    it 'Should check for the parent permission' do
      expect(@person.parent_permission).to eq(true)
    end
  end

  describe '#can_use_services? method' do
    it 'should return the boolean value false' do
      expect(@person.can_use_services?).to eq(true)
    end
  end

  describe '#correct_name method' do
    it 'should return the name of the person' do
      expect(@person.correct_name).to eq('Unknown')
    end
  end
end

describe Person do
  before(:each) do
    @person = Person.new(12, 'Person one')
    @person.id = 3
  end

  describe '#initialize' do
    it 'Should check for the age' do
      expect(@person.age).to eq(12)
    end

    it 'Should check for the name' do
      expect(@person.name).to eq('Person one')
    end

    it 'Should check for the parent permission' do
      expect(@person.parent_permission).to eq(true)
    end
  end

  describe '#can_use_services? method' do
    it 'should return the boolean value false' do
      expect(@person.can_use_services?).to eq(true)
    end
  end

  describe '#correct_name method' do
    it 'should return the name of the person' do
      expect(@person.correct_name).to eq('Person one')
    end
  end
end
