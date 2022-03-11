require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

# Defines the Person class
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rentals

  def add_rental(book, date)
    @rentals << Rental.new(date, self, book)
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

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
