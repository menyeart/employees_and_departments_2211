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
    @employee_expenses = Hash.new { |h, k| h[k] = [] }
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount)
    @expenses += amount
  end

  def employee_expense(employee, amount)
    @employee_expenses[employee] << amount
  end
end