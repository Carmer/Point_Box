class AddRedeemedPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :redeemed_points, :integer
  end
end
