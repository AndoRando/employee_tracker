require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a division", {:type => :feature}) do
  it("allows a user to add a new division") do
    visit("/")
    fill_in("name", :with => "Help Desk")
    click_button("Add division")
    expect(page).to have_content("Employdex")
  end
end

describe("adding an employee", {:type => :feature}) do
  it("allows a user to add a new employee to a division") do
    division_test = Division.create({:name => "Fun Desk"})
    visit('/')
    click_link("Fun Desk")
    fill_in("name", :with => "Ash Ketchum")
    click_button("Add employee")
    expect(page).to have_content("Employdex")
  end
end

describe("deletes a division") do
  it("allows a user to delete a division") do
    division_test = Division.create({:name => "Fun Desk"})
    visit('/')
    click_link("Fun Desk")
    click_button("Delete division")
    expect(page).to have_content("Employdex")
  end
end

describe("updates a division") do
  it("allows a user to update a division") do
    division_test = Division.create({:name => "Fun Desk"})
    visit('/')
    click_link("Fun Desk")
    fill_in("update_name", :with => "Not Fun Desk")
    expect(page).to have_content("Employdex")
  end
end

describe("deletes an employee") do
  it("allows a user to delete an employee") do
    division_test = Division.create({:name => "Fun Desk"})
    employee_test = Employee.create({:name => "Fun person", :division_id => division_test.id()})
    visit('/')
    click_link("Fun Desk")
    click_link("Fun person")
    click_button("Delete employee")
    expect(page).to have_content("Employdex")
  end
end

describe("updates an employee") do
  it("allows a user to update an employee") do
    division_test = Division.create({:name => "Fun Desk"})
    employee_test = Employee.create({:name => "Fun person", :division_id => division_test.id()})
    visit('/')
    click_link("Fun Desk")
    click_link("Fun person")
    fill_in("update_name", :with => "Not Fun person")
    expect(page).to have_content("Employdex")
  end
end
