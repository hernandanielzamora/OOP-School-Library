require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize(main)
    @main = main
    @people = []
    @books = []
    @rentals = []
  end

  def book_list
    if @books.empty?
      puts 'Book list is empty, please insert a book.'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    @main.menu
  end

  def people_list
    if @people.empty?
      puts 'People list is empty, please insert a person.'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name} - ID: #{person.id} - Age: #{person.age} "
      end
    end
    @main.menu
  end

  def create_person
    print 'Do you want to insert a stundent (1) or a teacher (2)? [Input the number]: '
    person_class = gets.chomp
    if person_class == '1'
      create_student
    elsif person_class == '2'
      create_teacher
    else 
      puts 'Invalid input! Please insert 1 (one) or 2 (two)'
    end
    @main.menu
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    student_permission = gets.chomp.downcase == 'y'
    person = Student.new(student_age, student_name, parent_permission: student_permission)
    @people << person
    puts
    puts 'Person (student) created successfully.'
  end
  

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    teacher_age.to_i
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(teacher_age, teacher_name, specialization)
    @people << person
    puts
    puts 'Person (teacher) created successfuly.'
  end

  def insert_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books << book
    puts
    puts 'Book inserted successfuly.'
    @main.menu
  end

  def create_rental
    puts 'Select a book (use the ID please), enter your choice below.'
    puts
    @books.each_with_index { |book, index| puts "ID: [#{index}] | Title: #{book.title} - Author #{book.author}" }
    puts
    print 'Please enter the number of the required book: '
    book_selected = gets.chomp.to_i

    puts 'Select a person from the following list (by number, not by ID)'
    puts
    @people.each_with_index do |person, index|
      puts "Number: [#{index}] | Name: #{person.name} - ID: #{person.id} - Age: #{person.age}"
    end
    puts
    print 'Enter the number of the corresponding person: '
    person_selected = gets.chomp.to_i

    print 'Date: '
    rental_date = gets.chomp
    rental = Rental.new(rental_date, @people[person_selected], @books[book_selected])
    @rentals << rental
    puts 'Your selected book has been rented'
    @main.menu

  end

  def rentals_person_list
    print 'People list: '
    puts
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name} - ID: #{person.id} - Age: #{person.age} "
    end
    puts
    print 'Person`s ID: '
    renter_id = gets.chomp.to_i
  
    puts 'Books rented:'
    puts
    rentals_for_id = @rentals.select { |rental| rental.person.id == renter_id }
    if rentals_for_id.empty?
      puts 'No rentals found for the given person ID.'
    else
      rentals_for_id.each do |rental|
        puts "Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
        puts "Rented by: #{rental.person.name}"
      end
    end

    @main.menu
  end
  

  def end
    puts 'Closing process...'
  end

end