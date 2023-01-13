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


end