require './person'

# Defines the Teacher class
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def self.save(people)
    data = []
    people.each do |person|
        data << {name: person.name, age: person.age, type: person.class, parent_permission: '', specialization: person.specialization}
    end
    file_writer = FileWriter.new(data, 'people.json')
    file_writer.write
  end

  def can_use_services?
    true
  end
end
