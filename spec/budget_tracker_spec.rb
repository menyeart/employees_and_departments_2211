require './lib/department'
require './lib/employee'
require './lib/budget_tracker'

describe 'budgettracker' do
  it "exists" do
    budget = BudgetTracker.new("2000")

    expect(budget).to be_an_instance_of(BudgetTracker)
  end

  it "does not have any departments by default" do
    budget = BudgetTracker.new("2000")

    expect(budget.departments).to eq([])
  end

  it "can add departments" do
    budget = BudgetTracker.new("2000")
    customer_service = Department.new("Customer Service")
    accounting = Department.new("Accounting")

    expect(budget.departments).to eq([])

    budget.add_department(customer_service)
    budget.add_department(accounting)

    expect(budget.departments).to eq([customer_service, accounting])
  end

  it "can list all departments with expenses less than $500" do
    budget = BudgetTracker.new("2000")
    customer_service = Department.new("Customer Service")
    accounting = Department.new("Accounting")
    human_resources = Department.new("Human Resources")

    budget.add_department(customer_service)
    budget.add_department(accounting)
    budget.add_department(human_resources)

    customer_service.expense(100)
    accounting.expense(400)
    human_resources.expense(700)

    expect(budget.expenses_under_500).to eq([customer_service, accounting])
  end

  it "can list all employees' salaries" do
    budget = BudgetTracker.new("2000")
    customer_service = Department.new("Customer Service")
    accounting = Department.new("Accounting")
    human_resources = Department.new("Human Resources")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    keith = Employee.new({name: "Keith Keitherson", age: "40", salary: "$200000"})
    jomah = Employee.new({name: "Jomah Jomers", age: "26", salary: "$800000"})
    sunita = Employee.new({name: "Sunita Suns", age: "39", salary: "$110000"})

    human_resources.hire(jomah)
    accounting.hire(keith)
    customer_service.hire(bobbi)
    customer_service.hire(sunita)
  
    budget.add_department(customer_service)
    budget.add_department(accounting)
    budget.add_department(human_resources)

    expect(budget.list_employee_salaries).to eq([100000, 110000, 200000, 800000])
  end

  it "can list all employees' salaries" do
    budget = BudgetTracker.new("2000")
    customer_service = Department.new("Customer Service")
    accounting = Department.new("Accounting")
    human_resources = Department.new("Human Resources")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    keith = Employee.new({name: "Keith Keitherson", age: "40", salary: "$200000"})
    jomah = Employee.new({name: "Jomah Jomers", age: "26", salary: "$800000"})
    sunita = Employee.new({name: "Sunita Suns", age: "39", salary: "$110000"})

    human_resources.hire(jomah)
    accounting.hire(keith)
    customer_service.hire(bobbi)
    customer_service.hire(sunita)
  
    budget.add_department(customer_service)
    budget.add_department(accounting)
    budget.add_department(human_resources)

    human_resources.expense(100)
    human_resources.expense(200)
    human_resources.employee_expense(jomah, 500)
    customer_service.employee_expense(bobbi, 300)
    customer_service.employee_expense(bobbi, 600)
    accounting.employee_expense(keith, 1000)
    
    expect(budget.total_all_expenses(bobbi)).to eq(900)
    expect(budget.total_all_expenses(jomah)).to eq(500)
  end


end