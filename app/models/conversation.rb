class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates_presence_of :topic
  validates_presence_of :opening_post

  def self.sort_by_last_edited
    self.order(updated_at: :desc)
  end

end
