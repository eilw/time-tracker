require 'rails_helper'

feature 'Timesheets' do
  background do
    client = FactoryGirl.create(:client)
    @project = FactoryGirl.create(:project, client: client)
    @employee = FactoryGirl.create(:employee)
    login_as(@employee)
    visit('/')
  end

  scenario 'Employee can add an activity to an existing project' do
    click_on('Add time')
    expect(page).to have_content('Date')
    expect(page).to have_content('Project')
    expect(page).to have_content('Hours')

    select(@project.name, from: 'timesheet_project_name')
    fill_in('timesheet_hours', with: 7)
    fill_in('timesheet_date', with: Date.today)
    click_on('Submit')
    expect(@project.activities.first.hours).to eq(7)
    expect(@project.activities.first.date).to eq(Date.today)
  end

  scenario 'A new project is created, if it doesnt exist already' do
    click_on('Add time')

    fill_in('timesheet_project_name', with: 'New project')
    fill_in('timesheet_hours', with: 7)
    click_on('Submit')
    expect(Project.all.count).to eq(2)
  end
end
