class CreateCategoryArticleJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :category_article_joins do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true

      t.boolean :archived, default: false, null: false

      t.timestamps
    end
  end
end
