
require 'rails_helper'

feature 'Reporting' do
  let(:employee) { FactoryGirl.create(:employee) }
  let(:second_employee) { FactoryGirl.create(:employee) }

  before do
    client = FactoryGirl.create(:client)
    project = FactoryGirl.create(:project, client: client)
    FactoryGirl.create(:activity, project: project)
    login_as(employee)
    visit('/')
  end

  scenario 'Can generate reports for each employee' do
    FactoryGirl.create(:activity, employee: second_employee)

    click_on('Report')
    select(second_employee.email, from: 'report_employee')
    expect(page).to have_content(Date.today)
  end
end
