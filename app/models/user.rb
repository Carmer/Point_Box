class User < ActiveRecord::Base

  has_attached_file :profile_picture, :styles => {:medium => "300x300x", :small => "200x200", :thumb => "100x100"}
  validates_attachment :profile_picture, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

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
