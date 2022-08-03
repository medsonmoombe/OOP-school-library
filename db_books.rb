
# require 'json'

# module BooksPersistence
#   def store_books(books)
#     data = []
#     file = './database/books.json'
#     !(File.exist?(file) && File.read(file) != '') && File.write(file, '[]')

#     return unless File.exist?(file)

#     books.each do |book|
#       data << { title: book.title, author: book.author }
#     end
#     File.write(file, JSON.generate(data))
#   end

#   def load_books
#     data = []
#     file = './database/books.json'
#     !(File.exist?(file) && File.read(file) != '') && File.write(file, '[]')
#     return data unless File.exist?(file) && File.read(file) != ''

#     JSON.parse(File.read(file)).each do |book|
#       data << Book.new(book['title'], book['author'])
#     end

#     data
#   end
# end

require 'json'
require './book'

module BooksController
  def load_books
    book_store = []
    book_file = open('./books.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = book_file.read
      JSON.parse(data).each do |book|
        book_store << Book.new(book['id'], book['title'], book['author'])
      end
    else
      File.write(book_file, '[]')
    end
    book_store
  end

  def save_books_to_file
    book_store = []
    @books.each do |book|
      book_store << { id: book.id, title: book.title, author: book.author }
    end
    File.write('./books.json', book_store.to_json)
  end
end
