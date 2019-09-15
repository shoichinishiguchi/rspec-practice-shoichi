require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  include LoginSupport

  scenario "user creates a new project" do
    user = FactoryBot.create(:user)

    # visit root_path
    # click_link "Sign in"
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user.password
    # click_button "Log in"
    sign_in user
    visit root_path  #deviseでは、これがないと通らない。user showにリダイレクとするから。
    # save_and_open_page
    expect{
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"}.to change(user.projects, :count).by(1)

      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"

  end

  # scenario "guest adds a project" do
  #   visit projects_path
  #   # save_and_open_page これを使うと、止めて、pageを表示する。launchy gemによって。
  #   click_link "New Project"
  # end
end
