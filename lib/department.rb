require './lib/employee'

class Department
  attr_reader :name, 
              :employees, 
              :expenses, 
              :employee_expenses

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @employee_expenses = []
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount)
    @expenses += amount
  end
end