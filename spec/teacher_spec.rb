require_relative '../classes/teacher'
require 'rspec'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Teacher one', 44)
    @teacher.id = 2
  end

  describe '#initialize' do
    it 'checking the teacher name to be Teacher one' do
      expect(@teacher.name).to eq('Teacher one')
    end

    it 'checking the teacher age to be 44' do
      expect(@teacher.age).to eq(44)
    end

    it 'checking the teacher specialization to be Uknown' do
      expect(@teacher.specialization).to eq('Unknown')
    end
  end

  describe '#can_use_services?' do
    it 'should return boolean value true' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end

  describe '#to_json' do
    it 'To check the teacher object to string' do
      expect(@teacher.to_json).to eq('{"id":2,"name":"Teacher one","age":44,"specialization":"Unknown"}')
    end
  end
end
