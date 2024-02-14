class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.boolean :archived, default: false, null: false
      t.boolean :pinned, default: false, null: false

      t.timestamps
    end
  end
end
