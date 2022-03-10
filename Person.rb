class Person

    def initialize(id, age, name = "Unknown", parent_permission = true)
        @id = id
        @name = name
        @age = age
    end

    def get_id
        return @id
    end

     def get_name
        return @name
    end

    def get_age
        return @age
    end

    def set_name(name)
        @name = name
    end

    def set_age(age)
        @age = age
    end

    def can_use_services?
        if (is_of_age? && parent_permission)
            return true;
        else 
            return false;
        end
    end

    private

    def is_of_age?
        if @age >= 18
            return true
        else 
            return false
        end
    end
end