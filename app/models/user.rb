class User < ActiveRecord::Base
  has_and_belongs_to_many :apartments

  validates :firstname, :lastname, :email, :password, presence: true
  validates :email, format: { with: /.+@.+\..+/, message: "only email format allowed" }
  validates :email, uniqueness: true
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
end
