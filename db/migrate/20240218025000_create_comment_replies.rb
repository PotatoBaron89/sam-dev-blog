class CreateCommentReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_replies do |t|
      t.belongs_to :comment, null: false, foreign_key: true
      t.belongs_to :commenter, null: false, foreign_key: { to_table: :users }

      t.text :body

      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
