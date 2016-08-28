class Post < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content

end
