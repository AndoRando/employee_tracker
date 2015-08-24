class AddDivisionIdToEmployees < ActiveRecord::Migration
  def change
    add_column(:employees, :list_id, :integer)
  end
end
