class User < ActiveRecord::Base
has_many :invitations,foreign_key: :invitee_id
    has_many :events, through: :invitations
  
	attr_accessor :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates :first_name, presence: :true
 validates :last_name, presence: :true
 validates :phone_number, presence: :true
 validates :password, presence: :true
 validates_confirmation_of :password
 validates :user_name,uniqueness: :true
 validates :email, presence: :true, uniqueness: :true
  
  def self.authenticate(user_name, password)
    # binding.pry
    user = find_by_user_name(user_name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      # binding.pry
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
