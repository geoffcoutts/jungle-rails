require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  def login
    visit root_path

    # save_screenshot

    page.find('#navbar').find_link('Login').click

    fill_in 'Email', with: "#{@user.email}"
    fill_in 'Password', with: "#{@user.password}"

    page.find('form').find_button('Login').click
  end

  before :each do

    @user = User.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "12345678",
      password_confirmation: "12345678"
      })
  end

  scenario "User clicks on login, goes to login page, then submits email and password to login" do

    login

    expect(page).to have_css 'div#navbar a', text: 'Logout'

    # save_screenshot

  end

  scenario "Logged in user clicks logout and it logs out of their account" do

    login

    # save_screenshot

    page.find('#navbar').find_link('Logout').click

    expect(page).to have_css 'div#navbar a', text: 'Login'

    # save_screenshot
  end
end
