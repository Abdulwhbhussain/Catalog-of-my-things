require_relative '../classes/student'
require 'rspec'

describe Student do
  before(:each) do
    @student = Student.new('Student one', 11)
    @student.id = 1
  end

  describe '#initialize' do
    it 'checking name' do
      expect(@student.name).to eq('Student one')
    end

    it 'checking age' do
      expect(@student.age).to eq(11)
    end

    it 'checking classroom to be nil' do
      expect(@student.classroom).to eq(nil)
    end
  end

  describe '#classroom method' do
    it 'return the classroom value' do
      expect(@student.classroom).to eq(nil)
    end
  end

  describe '#play_hooky method' do
    it 'Return the "¯\(ツ)/¯"' do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#to_json' do
    it 'JSON string of the student object' do
      expect(@student.to_json).to eq('{"id":1,"name":"Student one","age":11,"parent_permission":true,"classroom":null}')
    end
  end
end
