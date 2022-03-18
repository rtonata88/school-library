require './nameable'
require './rental'
require './file_reader'
require './capitalize_decorator'
require './trimmer_decorator'

# Defines the Person class
class Person
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(date, book)
    rental = Rental.new(date, self, book)
    rentals.push(rental)
  end

    def self.retrieve
    people = []
    file_reader = FileReader.new('people.json')
    content = file_reader.read
    content.each do |person| 
      case person['type']
      when 'Student'
        people << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      when 'Teacher'
        people << Teacher.new(person['age'], person['specialization'], person['name'])
      end
    end

    return people
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
