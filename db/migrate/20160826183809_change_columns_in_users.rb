class ChangeColumnsInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :image_url, default: "http://i0.wp.com/www.artifacting.com/blog/wp-content/uploads/2010/11/Kitten.jpg"
  end
end
