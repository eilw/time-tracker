require 'rails_helper'

feature 'Add new time entry' do
  background do
    @client = FactoryGirl.create(:client)
    @project = FactoryGirl.create(:project, client: @client)
    @employee = FactoryGirl.create(:employee)
    login_as(@employee)
    visit('/')
    click_on('Add time')
  end

  scenario 'Employee can add an activity to an existing client and project' do
    expect(page).to have_content('Client')
    expect(page).to have_content('Date')
    expect(page).to have_content('Project')
    expect(page).to have_content('Hours')

    select(@client.name, from: 'timesheet_client_name')
    select(@project.name, from: 'timesheet_project_name')
    fill_in('timesheet_hours', with: 7)
    fill_in('timesheet_date', with: Date.today)
    click_on('Submit')
    expect(@project.activities.first.hours).to eq(7)
    expect(@project.activities.first.date).to eq(Date.today)
  end

  scenario 'Employee can add a new project, if it doesnt exist already' do
    expect(page).to have_content('Add new project')
    select(@client.name, from: 'timesheet_client_name')
    fill_in('timesheet_new_project_name', with: 'New project')
    fill_in('timesheet_hours', with: 7)
    click_on('Submit')
    expect(Project.all.count).to eq(2)
  end

  scenario 'Employee can create a new client with a new project' do
    expect(page).to have_content('Add new client')

    fill_in('timesheet_new_client_name', with: 'New client')
    fill_in('timesheet_new_project_name', with: 'New project')
    fill_in('timesheet_hours', with: 7)
    click_on('Submit')
    expect(Project.all.count).to eq(2)
    expect(Client.all.count).to eq(2)
  end
end
