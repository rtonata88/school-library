require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Testing Student class' do
    before :each do
      @student = Student.new(34, 99, 'Richard Chambula', parent_permission: false)
    end

    it 'takes four parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end

    it 'returns the correct age' do
      expect(@student.age).to eql 34
    end

    it 'returns the correct name' do
      expect(@student.name).to eql 'Richard Chambula'
    end
  end
end
