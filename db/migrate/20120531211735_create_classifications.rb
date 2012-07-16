class CreateClassifications < ActiveRecord::Migration
  def up
    create_table :classifications do |t|
      t.integer :classificable_id
      t.string :classificable_type
      t.integer :category_id
      t.timestamps
    end
    Classification.reset_column_information
    add_index :classifications, :classificable_type
    add_index :classifications, :classificable_id
    add_index :classifications, :category_id
  end

  def down
    drop_table :classifications
  end
end
