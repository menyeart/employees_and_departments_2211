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
end