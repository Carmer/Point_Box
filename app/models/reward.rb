class Reward < ActiveRecord::Base

  has_attached_file :image, :styles => {:small => "200x200", :thumb => "100x100"}
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  has_many :user_rewards
  has_many :users, through: :user_rewards

  validates :name, presence: :true
  validates :description, presence: :true
  validates :cost, presence: :true

  def to_s
    name
  end
end
