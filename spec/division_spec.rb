require("spec_helper")

describe(Division) do
  describe("#employees") do
    it("tells which employees are in it") do
      test_division = Division.create({:name => "IT"})
      test_employee1 = Employee.create({:name => "Alexa Zeazas", :division_id => test_division.id()})
      test_employee2 = Employee.create({:name => "Andrew Brennwald", :division_id => test_division.id()})
      expect(test_division.employees()).to(eq([test_employee1, test_employee2]))
    end
  end
end
