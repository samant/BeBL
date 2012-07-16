class CreateUtilisations < ActiveRecord::Migration
  def up
    create_table :utilisations do |t|
      t.integer :component_id
      t.integer :project_id
      t.timestamps
    end
    Utilisation.reset_column_information
    add_index :utilisations, :component_id
    add_index :utilisations, :project_id
  end

  def down
    drop_table :utilisations
  end
end
