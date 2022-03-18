require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # 1. List all books
  def list_all_books
    puts "\n \n"
    if @books.length.zero?
      puts 'No books to display'
    else
      @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts "\n \n"
  end

  # 2. List all people
  def list_all_people
    puts "\n \n"
    if @people.count.zero?
      puts 'No people to display'
    else
      @people.map { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
    end
    puts "\n \n"
  end

  # 3. Create a person
  def create_person
    option = gets.chomp.to_i

    case option
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid option selected, please select a valid option'
    end
  end

  def add_student
    print 'Student age: '
    age = gets.chomp.to_i

    print 'Student name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = (parent_permission_input == 'y')

    @people << Student.new(age, name, parent_permission: parent_permission)
    puts "\n \n"
    puts 'Student created successfully!!!'
    puts "\n \n"
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)

    puts "\n \n"
    puts 'Teacher created successfully!!!'
    puts "\n \n"
  end

  # 4. Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    book.save
    puts "#{title} by #{author} created successfully!!!"
  end

  # 5. Create a rental
  def add_rental
    puts "\n"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
    print 'Select the person from the list above [input number]:'

    selected_person = gets.chomp.to_i
    person = @people[selected_person]

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title},  Author: #{book.author}"
    end
    print 'Select the book from the list above [input number]:'
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    print 'Date: '
    date = gets.chomp

    # Add book to rentals
    new_rental = Rental.new(date, person, book)
    @rentals << new_rental
    new_rental.save(@rentals)
    puts "Rental successfully created !!! \n \n"
  end

  # 6. List all rentals for a given person ID
  def list_rentals_by_person
    puts "\n \n"
    if @people.length
      @people.each do |person|
        puts "[#{person.class.name}] - ID: #{person.id}, Name: #{person.name}, Age: (#{person.age})"
      end
    else
      puts 'No people to display'
    end
    puts "\n \n"
    print 'Enter Person ID: '
    person_id = gets.chomp.to_i
    person = @rentals.select { |p| p.person.id == person_id }
    # rentals = person.rentals
    person.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}" }
  end
end
