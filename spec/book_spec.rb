require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Book do
  context 'Setup Book class' do
    before :each do
      @book = Book.new('Lord of the Rings', 'JRR Tolkiens')
      student = Student.new(34, 99, 'Richard Chambula', parent_permission: false)
      Rental.new('23 May 2022', @book, student)
    end

    it 'takes two parameters and returns a Book object' do
        expect(@book).to be_an_instance_of Book
    end

    it "returns the correct title" do
        expect(@book.title).to eql "Lord of the Rings"
    end

    it "returns the correct author" do
        expect(@book.author).to eql "JRR Tolkiens"
    end

    it "It is rented out" do 
        expect(@book.rentals.length).to eq(1)
    end
  end
end