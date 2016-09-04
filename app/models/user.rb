class User < ActiveRecord::Base
  has_many :conversations
  has_many :posts

  has_secure_password

  validates_presence_of :username
  validates_presence_of :email

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def ban_button
    if self.banned
      "Unban"
    else
      "Ban"
    end
  end

end
