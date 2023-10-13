require_relative '../classes/classroom'
require 'rspec'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Room 101')
  end

  describe '#initialize' do
    it 'should have a label' do
      expect(@classroom.label).to eq('Room 101')
    end

    it 'should have an empty students array' do
      expect(@classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    before(:each) do
      @student = double('student')
      allow(@student).to receive(:classroom=)
    end
    it 'should add a student to the students array' do
      @classroom.add_student(@student)
      expect(@classroom.students).to eq([@student])
    end
  end
end
