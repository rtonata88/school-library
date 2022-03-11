#Defines the Book class blueprint
class Book
    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    attr_accessor :title, :author

    def rent_out(person, date)
        @rentals << Rental.new(date, person, self)
    end
end