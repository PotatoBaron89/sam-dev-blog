class NewUserFields < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :alias, :string

    add_column :users, :nationality, :string
    add_column :users, :location, :string
  end
end
