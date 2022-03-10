require "./Person.rb"
class Teacher < Person
    initialize(specialization)
        super()
        @specialization = specialization
    end

    def can_use_services?
        return true
    end
end