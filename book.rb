require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_a_book(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
