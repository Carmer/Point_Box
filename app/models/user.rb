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

  def self.find_or_create_by_auth(auth_data)
    user = User.where(provider: auth_data['provider'], id: auth_data['uid']).first_or_create
    if user.first_name != parsed_auth_first_name(auth_data) || user.last_name != parsed_auth_last_name(auth_data)
      user.first_name = parsed_auth_first_name(auth_data)
      user.last_name = parsed_auth_last_name(auth_data)
      user.save
    end
    user
  end

  def parsed_auth_first_name(auth_data)
    auth_data["info"]["name"].split(" ")[0]
  end

  def parsed_auth_last_name(auth_data)
    auth_data["info"]["name"].split(" ")[1]
  end
end
