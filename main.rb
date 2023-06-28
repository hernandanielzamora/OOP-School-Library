require_relative './app'

class Program
  def initialize
    @app = App.new(self)

    puts "\n--- Library Management System ---"
    menu
  end

  def menu
    puts "\n--- Please, select an option ---"
    puts
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Exit"
    puts
    print "Enter your choice: "
    
    choice = gets.chomp.to_i
    run_app(choice)
  end

  def run_app(choice)
    methods = {
      1 => :book_list,
      2 => :people_list,
      3 => :create_person,
      4 => :insert_book,
      5 => :create_rental,
      6 => :rentals_person_list,
      7 => :end
    }
    
    method = methods[choice]
    if method.nil?
      puts 'Invalid option, please enter a number from 1 to 7.'
      menu
    else
      @app.send(method)
    end
  end
end

def main
  Program.new
end

main
