class CreateComponents < ActiveRecord::Migration
  def up
    create_table :components do |t|
      t.string :name
      t.text :description
      t.string :ctype
      t.timestamps
    end
  end

  def down
    drop_table :components
  end
end
