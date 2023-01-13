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
end