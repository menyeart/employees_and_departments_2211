require './lib/employee'

describe 'employee' do
  it "exists" do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    
    expect(bobbi).to be_an_instance_of(Employee)
  end




end