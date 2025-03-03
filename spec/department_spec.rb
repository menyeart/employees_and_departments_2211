require './lib/department'
require './lib/employee'

describe 'department' do
  it "exists" do
    customer_service = Department.new("Customer Service")
    
    expect(customer_service).to be_an_instance_of(Department)
  end

  it "does not have employees by default" do
    customer_service = Department.new("Customer Service")
    
    expect(customer_service.employees).to eq([])
  end

  it "it can hire employees" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 

    expect(customer_service.employees).to eq([])

    customer_service.hire(bobbi)
    customer_service.hire(aaron) 

    expect(customer_service.employees).to eq([bobbi, aaron])
  end

  it "it starts with zero expenses by default" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
   
    customer_service.hire(bobbi)
    customer_service.hire(aaron) 

    expect(customer_service.expenses).to eq(0)
  end

  it "it can add expenses" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    customer_service.hire(bobbi)
    customer_service.hire(aaron) 

    customer_service.expense(100)
    expect(customer_service.expenses).to eq(100)
    customer_service.expense(25)    
    expect(customer_service.expenses).to eq(125)
  end

  it "starts with no employee expenses by default" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    customer_service.hire(bobbi)
    customer_service.hire(aaron) 
    expect(customer_service.employee_expenses).to eq({})
  end

  it "can add expenses and list them by employee" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    customer_service.hire(bobbi)
    customer_service.hire(aaron) 

    customer_service.employee_expense(aaron, 500)
    customer_service.employee_expense(aaron, 100)
    customer_service.employee_expense(bobbi, 400)

    expect(customer_service.employee_expenses).to eq(
      {
        aaron => [500,100], 
        bobbi => [400]
      })
  end
end