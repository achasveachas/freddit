class Conversation < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates_presence_of :topic

  def self.sort_by_last_edited
    self.all.to_ary.sort_by do |convo|
      convo.posts.last.created_at 
    end
  end

end
