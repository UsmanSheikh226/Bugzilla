class CreateBug < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.text :title
      t.string :description
      t.text :assigned

      t.timestamps
    end
  end
end
