class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards

  validates :name, presence: :true
  validates :description, presence: :true
  validates :cost, presence: :true
end
