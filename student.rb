require './person'

# Defines the Student class
class Student < Person
  attr_accessor :classroom, :name, :id

  def initialize(age, id = 0, name = 'Unknown', parent_permission: true)
    super(age, id: id, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
