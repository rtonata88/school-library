require_relative '../teacher'

describe Teacher do
  context 'Setup Teacher class' do
    before :each do
      @teacher = Teacher.new(40, 'Engineering', 78, 'Arnold Chambula')
    end

    it 'takes four parameters and returns a Student object' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'returns the correct specialization' do
      expect(@teacher.specialization).to eql 'Engineering'
    end

    it 'returns the correct age' do
      expect(@teacher.age).to eql 40
    end

    it 'returns the correct id' do
      expect(@teacher.id).to eql 78
    end

    it 'returns the correct name' do
      expect(@teacher.name).to eql 'Arnold Chambula'
    end
  end
end
