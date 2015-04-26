class AddPaperclipToRewards < ActiveRecord::Migration
  def change
    add_attachment :rewards, :image
  end
end
