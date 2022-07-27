require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @id = Random.rand(1...1000)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end

# rubocop:enable Style/OptionalBooleanParameter
