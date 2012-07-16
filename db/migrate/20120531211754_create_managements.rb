class CreateManagements < ActiveRecord::Migration
  def up
    create_table :managements do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
    Management.reset_column_information
    add_index :managements, :user_id
    add_index :managements, :project_id
  end

  def down
    drop_table :managements
  end
end
