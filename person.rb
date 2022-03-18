require './nameable'
require './rental'
require './file_reader'
require './capitalize_decorator'
require './trimmer_decorator'

# Defines the Person class
class Person
  attr_reader :rentals, :parent_permission
  attr_accessor :name, :age, :id

  def initialize(age, id: 0, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(date, book)
    rental = Rental.new(date, self, book)
    rentals.push(rental)
  end

  def self.save(people)
    data = []
    people.each do |person|
      case person.class.to_s
      when 'Student'
        data << { id: person.id, name: person.name, age: person.age, type: person.class,
                  parent_permission: person.parent_permission }
      when 'Teacher'
        data << { id: person.id, name: person.name, age: person.age, type: person.class,
                  specialization: person.specialization }
      end
    end
    file_writer = FileWriter.new(data, 'people.json')
    file_writer.write
  end

  def self.retrieve
    people = []
    file_reader = FileReader.new('people.json')
    content = file_reader.read
    content.each do |person|
      case person['type']
      when 'Student'
        people << Student.new(person['age'], person['id'], person['name'],
                              parent_permission: person['parent_permission'])
      when 'Teacher'
        people << Teacher.new(person['age'], person['specialization'], person['id'], person['name'])
      end
    end

    people
  end

  def can_use_services?
    if of_age? && @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
