# Defines the Book class blueprint
class Book
    attr_accessor :title, :author

    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    def rent_out(person, date)
        @rentals << Rental.new(date, person, self)
    end
end
