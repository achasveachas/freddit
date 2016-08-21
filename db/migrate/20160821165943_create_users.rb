class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :age
      t.string :location
      t.string :image_url
      t.boolean :moderator, :default => false
      t.boolean :admin, :default => false
      t.timestamps null: false
    end
  end
end
