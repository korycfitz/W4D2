require_relative "Employee.rb"

class Manager < Employee
    attr_reader :employees_assigned
    def initialize(name, salary, title, boss)
        super(name, salary, title, boss)
        @employees_assigned = []
    end

    def assign_employees
        if self.title == "founder"
            employees_assigned.push("Darren", "Shawna", "David")
        elsif self.title == "TA_Manager"
            employees_assigned.push("Shawna", "David")
        else 
            employees_assigned = nil
        end
    end

    def find_bonus(multiplier)
        if employees_assigned.nil? 
            return self.bonus(multiplier)
        end

        queue = self.assign_employees
        total_salary_of_all_sub_employees = 0
        until queue.empty? 
            test_position = queue.shift
            total_salary_of_all_sub_employees += test_position.salary
        end

        bonus = (total_salary_of_all_sub_employees) * multiplier
        bonus

        
    end

end
ned = Manager.new("Ned", 1000000, "founder", nil)
darren = Manager.new("Darren", 78000, "TA_Manager", ned)
david = Employee.new("David", 10000, "TA", darren)
shawna = Employee.new("Shawna", 12000, "TA", darren) 

p ned.bonus(5) # => 500_000
p darren.find_bonus(4) # => 88_000
p david.bonus(3) # => 30_000