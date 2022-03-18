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

  def self.save(books)
    data = []
    books.each do |book|
        data << {title: book.title, author: book.author}
    end
    file_writer = FileWriter.new(data, 'books.json')
    file_writer.write
  end

  def self.retrieve
    books = []
    file_reader = FileReader.new('books.json')
    content = file_reader.read
    content.each do |book| 
       books << Book.new(book['title'], book['author'])
    end

    return books
  end
end
