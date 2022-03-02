class AddAssignedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :assigned, :string
  end
end
