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



end