require_relative "Employee.rb"

# class Manager < Employee #manager should have an attribute that holds an array of all employees assigned to the manager
    # attr_reader :employees_assigned
    # def initialize(name, salary, title, boss)
    #     super(name, salary, title, boss)
    #     @employees_assigned = []
    # end

    # def assign_employees
    #     if self.title == "founder"
    #         employees_assigned.push("Darren", "Shawna", "David")
    #     elsif self.title == "TA_Manager"
    #         employees_assigned.push("Shawna", "David")
    #     else 
    #         employees_assigned = nil
    #     end
    # end

    # def find_bonus(multiplier)
        # if employees_assigned.nil? 
        #     return self.bonus(multiplier)
        # end

        # queue = self.assign_employees
        # total_salary_of_all_sub_employees = 0
        # until queue.empty? 
        #     test_position = queue.shift
        #     total_salary_of_all_sub_employees += test_position.salary
        # end

        # bonus = (total_salary_of_all_sub_employees) * multiplier
        # bonus

        
    # end

# end


class Manager
    attr_reader :managers_employees
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @managers_employees = []
    end

    def assign_employee(employee)
        managers_employees << employee
        employee
    end

    def bonus(multiplier)
        bonus = self.managers_employees_salary * multiplier
        bonus
    end

    def managers_employees_salary
        employees_salary = 0
        self.managers_employees.each do |employee|
           if employee.is_a? Manager 
                employees_salary += employee.salary + employee.managers_employees_salary   #(total salary of all sub-employees) * multiplier #recursively call this because we are referring to a manager so we need to get their employees subsalaries and recursively add to this until there are only employees that arent managers
           else
                employees_salary += employee.salary
           end
        end
        employees_salary
    end
end

ned = Manager.new("Ned", 1000000, "founder", nil)
darren = Manager.new("Darren", 78000, "TA_Manager", ned)
david = Employee.new("David", 10000, "TA", darren)
shawna = Employee.new("Shawna", 12000, "TA", darren) 

ned.assign_employee(darren)
darren.assign_employee(david)
darren.assign_employee(shawna)

p ned.bonus(5) # => 500_000
p darren.find_bonus(4) # => 88_000
p david.bonus(3) # => 30_000