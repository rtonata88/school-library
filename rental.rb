# Defines the Rental class blueprint
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    # book.rentals << self unless book.rentals.include?(self)

    @person = person
    puts "Person methods: #{person.methods}"
    person.person_rentals << self unless person.person_rentals.include?(self)
  end
end
