require 'rails_helper'

feature 'Activities' do
  background do
    @employee = FactoryGirl.create(:employee)
    FactoryGirl.create_list(:activity, 10, employee: @employee)

    login_as(@employee)
    visit(new_timesheet_path)
  end

  xscenario 'See list of previous activities' do
    expect(page).to have_content('Previous activities')

    fill_in('timesheet_new_client_name', with: 'New client')
    fill_in('timesheet_new_project_name', with: 'New project')
    fill_in('timesheet_hours', with: 7)
    click_on('Submit')
    expect(Project.all.count).to eq(2)
    expect(Client.all.count).to eq(2)
  end
end
