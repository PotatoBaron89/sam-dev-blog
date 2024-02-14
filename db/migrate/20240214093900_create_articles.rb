class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name, null: false

      t.boolean :archived, default: false, null: false
      t.boolean :featured, default: false, null: false

      t.timestamps
    end
  end
end
