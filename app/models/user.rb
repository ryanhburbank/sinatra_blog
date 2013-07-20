class User < ActiveRecord::Base
  has_many :posts
  validates :name, :email, :password, :presence => true 
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, :length => { :minimum => 5, :maximum => 40 }
  #add validations

  def self.authenticate(email, password)
    self.find_by_email_and_password(email, password)
  end
end
