class RemoveOpeningPostFromConversations < ActiveRecord::Migration
  def change
    remove_column :conversations, :opening_post
  end
end
