class CreateNewsLetterSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :news_letter_subscriptions do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
