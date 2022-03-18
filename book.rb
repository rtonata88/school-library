require './rental'
require './file_reader'
require './file_writer'
# Defines the Book class blueprint
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, person, self)
    @rentals.push(rental)
  end

  def save
    data = []
    self.each do |book|
      data <<  { { title: book.title, author: book.author } }
    end

    file_writer = FileWriter.new(data, 'books.json')
    file_writer.write
  end

  def list(books); end
end

#name: person.name, age: person.age, type: person.class, parent_permission: person.parent_permission, specialization: person.specialization