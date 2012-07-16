class Fileuploader < ActiveRecord::Migration
 def up
    create_table(:attachments) do |t|
      t.references :project
      t.string :file
      t.timestamps
    end
  end

  def down
    drop_table :attachments
  end  
end
