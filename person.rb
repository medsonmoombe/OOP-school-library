# rubocop: disable Style/OptionalBooleanParameter

require_relative './nameable'
require_relative './decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end
person = Person.new(22, 'maximilianus')
  puts person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  puts capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name
# rubocop: enable Style/OptionalBooleanParameter
