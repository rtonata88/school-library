require './person'

# Defines the Student class
class Student < Person
  attr_accessor :classroom, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def self.save(people)
    data = []
    people.each do |person|
        data << {name: person.name, age: person.age, type: person.class, parent_permission: person.parent_permission, specialization: ''}
    end
    file_writer = FileWriter.new(data, 'people.json')
    file_writer.write
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
