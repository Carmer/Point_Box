require 'rails_helper'

RSpec.describe "admin adding points" do
  let!(:user1) {
    User.create(first_name: "Travis",
                        last_name: "Mejia",
                        username: "dhdhdht",
                        password: "password")
                      }

  let!(:user2) {
    User.create(first_name: "jake",
                        last_name: "Carmer",
                        username: "jakeyjake",
                        password: "password")
                      }

  let!(:user3) {
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
      expect(page).to have_content(user1.username)
      expect(page).to have_content(user2.username)
      expect(page).to have_content(user3.username)

      first(:link, "Add Points").click
      fill_in "user[points]", with: 50
      click_button "Add Points"

      expect(page).to have_content(user1.username)
      expect(page).to have_content(60)
    end
  end
end
