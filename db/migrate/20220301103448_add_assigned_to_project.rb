class AddAssignedToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :assigned, :string
  end
end
