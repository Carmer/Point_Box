class User < ActiveRecord::Base

  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  enum role: %w(default admin)

  def admin?
    role == "admin"
  end
end
