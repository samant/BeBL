class AddInfosToProject < ActiveRecord::Migration
  def up
    add_column :projects, :estimated_duration, :string
    add_column :projects, :real_duration, :string
    add_column :projects, :client_name, :string
    add_column :projects, :github_address, :string
    add_column :projects, :production_address, :string
    add_column :projects, :staging_address, :string
    add_column :projects, :production_account, :string
    add_column :projects, :production_password, :string
    add_column :projects, :staging_account, :string
    add_column :projects, :staging_password, :string
  end
  
  def down
    remove_column :projects, :estimated_duration
    remove_column :projects, :real_duration
    remove_column :projects, :client_name
    remove_column :projects, :github_address
    remove_column :projects, :production_address
    remove_column :projects, :staging_address
    remove_column :projects, :production_account
    remove_column :projects, :production_password
    remove_column :projects, :staging_account
    remove_column :projects, :staging_password
  end
end