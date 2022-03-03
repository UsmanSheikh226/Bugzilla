class RemoveAssignedFromProject < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :assigned, :string
  end
end
