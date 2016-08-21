class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :topic
      t.string :opening_post
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
