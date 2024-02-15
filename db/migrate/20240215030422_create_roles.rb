class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
