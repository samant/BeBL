class CreateDevelpments < ActiveRecord::Migration
  def up
    create_table :developments do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
    Development.reset_column_information
    add_index :developments, :user_id
    add_index :developments, :project_id
  end

  def down
    drop_table :developments
  end
end
