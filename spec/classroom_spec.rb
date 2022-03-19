require_relative '../student'
require_relative '../classroom'

describe Classroom do
  context 'Setup Classroom class' do
    before :each do
      @student = Student.new(34, 99, 'Richard Chambula', parent_permission: false)
      @classroom = Classroom.new('LH17')
    end

    it 'returns the correct classname' do
      expect(@classroom.label).to eq('LH17')
    end

    it 'has students' do
      @classroom.add_student(@student)
      expect(@classroom.students.length).to eq(1)
    end
  end
end
