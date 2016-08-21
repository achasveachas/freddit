class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates_presence_of :topic
  validates_presence_of :opening_post

end
