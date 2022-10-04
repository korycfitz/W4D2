class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, salary, title, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        employee_bonus = (self.salary) * multiplier
        employee_bonus
    end

end

david = Employee.new("David", 10000, "TA", "Darren")
shawna = Employee.new("Shawna", 12000, "TA", "Darren") 