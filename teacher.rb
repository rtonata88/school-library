require './person'

# Defines the Teacher class
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, id = 0, name = 'Unknown')
    super(age, id: id, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
