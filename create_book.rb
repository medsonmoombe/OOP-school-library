require_relative './book'
require './db_books'

class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Enter Title: '
    title = gets.chomp.strip.capitalize

    print 'Enter Author: '
    author = gets.chomp.strip.capitalize

    @books << Book.new(nil, title, author)
    puts
    puts 'Book was created successfully!'
    puts
  end
end
