# rubocop:disable Style/OptionalBooleanParameter

require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_service?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

# rubocop:enable Style/OptionalBooleanParameter
