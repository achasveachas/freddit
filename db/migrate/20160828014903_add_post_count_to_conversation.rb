class AddPostCountToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :post_count, :integer, default: 0
  end
end
