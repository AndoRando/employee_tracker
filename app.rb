require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
also_reload('/lib/**/*.rb')
require("pg")
require("pry")

get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/divisions") do
  @division = Division.create({:name => params.fetch("name")})
  redirect("/")
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

delete("/divisions/:id") do
  # Add stuff here later
end

patch("/divisions/:id") do
  # Add stuff here later
end

get("/employees/:id") do
  # Add stuff here later
end

post("/employees") do
  @employee = Employee.create({:name => params.fetch("name"), :division_id => params.fetch("division_id")})
  redirect("/")
end

delete("/employees/:id") do
  # Add stuff here later
end

patch("/employees/:id") do
  # Add stuff here later
end
