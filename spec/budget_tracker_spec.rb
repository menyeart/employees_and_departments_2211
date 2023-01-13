require './lib/department'
require './lib/employee'
require './lib/budget_tracker'

describe 'budgettracker' do
  it "exsits" do
    budget = BudgetTracker.new("2000")

    expect(budget).to be_an_instance_of(BudgetTracker)
  end
end