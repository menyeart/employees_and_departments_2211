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

end