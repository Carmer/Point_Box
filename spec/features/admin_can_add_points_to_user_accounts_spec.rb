require 'rails_helper'

RSpec.describe "admin adding points" do
  let!(:users) {
    User.create(first_name: "Bobby",
                        last_name: "Mejia",
                        username: "waits",
                        password: "password")

    User.create(first_name: "Andrew",
                        last_name: "Carmer",
                        username: "ajc",
                        password: "password")

    User.create(first_name: "jon",
                        last_name: "doe",
                        username: "jdf",
                        password: "password")
  }
  context "as an admin" do
    it "can add points to any user" do
      admin = User.create(first_name: "Richard",
                          last_name: "Mejia",
                          username: "lilrich",
                          password: "password",
                          role: 1)



      visit admin_login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_button "Login"

      visit admin_users_path
      expect(page).to have_content(User.first.username)
      expect(page).to have_content(User.last.username)

      first(:link, "Add Points").click
      fill_in "user[points]", with: 50
      click_button "Add Points"
      save_and_open_page
      expect(current_path).to eq(admin_user_path(User.first))
      expect(page).to have_content(User.first.username)
      expect(page).to have_content(User.first.points)
      expect(page).to have_content(60)
    end
  end
end
