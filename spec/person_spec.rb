require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context 'Setup Person class' do
    before :each do
      @person = Person.new(34, name: 'Richard Chambula', parent_permission: false)
      book = Book.new('Lord of the Rings', 'JRR Tolkiens')
      Rental.new('23 May 2022', book, @person)
    end

    it 'takes four parameters and returns a Person object' do
        expect(@person).to be_an_instance_of Person
    end

    it "returns the correct age" do
        expect(@person.age).to eql 34
    end

     it "returns the correct name" do
        expect(@person.name).to eql "Richard Chambula"
    end

    it "To have rented out a book" do 
        expect(@person.rentals.length).to eq(1)
    end
  end
end