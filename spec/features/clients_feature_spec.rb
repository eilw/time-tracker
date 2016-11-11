require 'rails_helper'

feature 'Create new client' do
  background do
    employee = FactoryGirl.create(:employee)
    login_as(employee)
    visit('/')
  end

  scenario 'create a new client' do
    click_on('Clients')
    click_on('Create new client')
    fill_in('client_name', with: 'Client A')
    click_on('Submit')
    expect(page).to have_content('Client A created')
  end
end
