class BudgetTracker
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def expenses_under_500
    @departments.find_all { |department| department.expenses < 500 }
  end

  def list_employee_salaries
    @departments.map do |department|
      department.employees.map do |employee|
        employee.salary
      end
    end.flatten
  end
end