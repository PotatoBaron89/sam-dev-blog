class AddFeaturedToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :featured, :boolean, default: false
  end
end
