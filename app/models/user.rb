class User < ActiveRecord::Base
  has_many :conversations
  has_many :posts

  has_secure_password

  validates_presence_of :username
  validates_presence_of :email

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def ban_button
    self.banned ? "Unban" : "Ban"
  end

  def mod_button
    self.moderator ? "Revoke Moderator Privilages" : "Grant Moderator Privilages"
  end

end
