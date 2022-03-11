#Defines the Rental class blueprint
class Rental
    def initialize(date, person, book)
        @date = date
        @person = person
        @book = book

        person.rentals << self
    end

    attr_accessor :date, :person, :book
end