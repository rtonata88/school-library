require './person'
require './book'
# Defines the Rental class blueprint
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rentals << self unless book.rentals.include?(self)

    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end

  def save(rentals)
    data = []
    rentals.each do |rental|
      data <<  {  date: rental.date, 
                  person: {id: person.id },
                  book: { title: rental.book.title, author: rental.book.author } }
    end

    file_writer = FileWriter.new(data, 'rentals.json')
    file_writer.write
  end
end
