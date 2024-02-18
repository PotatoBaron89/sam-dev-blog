class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false

      t.belongs_to :commenter, null: false, foreign_key: { to_table: :users }, index: false
      t.text :body

      t.boolean :archived, default: false, null: false

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id], where: 'archived = false'
    add_index :comments, [:commentable_type, :commentable_id], where: 'archived = true', name: 'index_comments_archived'

    add_index :comments, :commenter_id, where: 'archived = false'
    add_index :comments, :commenter_id, where: 'archived = true', name: 'index_comments_archived_commenter'
  end
end
