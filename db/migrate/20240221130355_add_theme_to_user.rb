class AddThemeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :theme, :string, default: '', null: false
  end
end
