require 'rails_helper'

RSpec.describe TimesheetsController, type: :controller do
  let(:project) { FactoryGirl.create(:project, client: FactoryGirl.create(:client)) }
  let(:employee) { Employee.all.first }
  let(:timesheet) { Timesheet.new }

  describe '#add_time' do
    login_employee
    let!(:subject) { post :add_time, timesheet: { project_name: project.name, hours: 8 } }

    it 'creates a new activity' do
      expect(Activity.all.count).to eq(1)
    end

    it 'redirects to new_timesheet' do
      post :add_time, timesheet: { project_name: project.name, hours: 8 }

      expect(subject).to redirect_to(new_timesheet_path)
    end
  end
end
