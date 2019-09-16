require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  include LoginSupport

  scenario "user creates a new project" do
    user = FactoryBot.create(:user)

    sign_in_as user ##自作したログインメソッド

    # sign_in user #devise用のメソッド
    # visit root_path  #deviseでは、これがないと通らない。user showにリダイレクとするから。
    # save_and_open_page

    expect{
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"
    }.to change(user.projects, :count).by(1)

      aggregate_failures do
        expect(page).to have_content "Project was successfully created"
        expect(page).to have_content "Test Project"
        expect(page).to have_content "Owner: #{user.name}"
      end
  end

  # scenario "guest adds a project" do
  #   visit projects_path
  #   # save_and_open_page これを使うと、止めて、pageを表示する。launchy gemによって。
  #   click_link "New Project"
  # end
end
