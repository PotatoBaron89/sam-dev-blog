class CreateFavouritedArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :favourited_articles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
