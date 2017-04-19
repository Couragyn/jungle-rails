require 'rails_helper'

RSpec.feature "Visitor logs in", type: :feature, js: true do

  # SETUP
  before :each do
    user = User.create(
      name: "Joe",
      email: "joe_gato@gmail.com",
      password: "qwerty",
      password_confirmation: "qwerty"
      )
  end

  scenario "They are redirected to home, and are loged in" do
    visit '/login'

    fill_in 'email', with: 'joe_gato@gmail.com'
    fill_in 'password', with: 'qwerty'
    click_on 'Submit'

    save_and_open_screenshot
    page.has_content?('My Cart (1)')
    expect(page.has_content?('Logout')).to be true

  end

end