require 'rails_helper'

feature "User can sign in and out" do
  context "user not logged in and on the homepage" do
    scenario "should see a 'log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'Log out' link" do
      visit('/')
      expect(page).not_to have_link('Log out')
    end
  end

  context 'signing up' do
    scenario 'A user does not get access until approved by admin' do
      visit('/')
      click_link('Sign up')
      fill_in('employee_email', with: 'test@email.com')
      fill_in('employee_password', with: '12345678')
      fill_in('employee_password_confirmation', with: '12345678')
      click_button('Sign up')

      expect(page).to have_content('Welcome')
    end
  end

  context 'user logged in on the homepage' do
    scenario "should see 'Log out' link" do
      employee = FactoryGirl.create(:employee)
      login_as(employee)

      visit('/')
      expect(page).to have_link('Log out')
    end

    scenario "should not see a 'log in' link and a 'sign up' link" do
      employee = FactoryGirl.create(:employee)
      login_as(employee)

      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
