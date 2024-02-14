class AddColourToCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :colour, :string
  end
end
