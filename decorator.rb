require './nameable'

#Defines the base decorator
class Decorator
    initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end
end