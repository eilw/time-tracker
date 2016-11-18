require 'rails_helper'

RSpec.describe Timesheet, type: :model do
  let(:project) { FactoryGirl.create(:project, client: FactoryGirl.create(:client)) }
  let(:employee) { FactoryGirl.create(:employee) }
  let(:timesheet) { Timesheet.new(employee: employee) }

  describe '#add_time' do
    before do
      timesheet.project_name = project.name
      timesheet.client_name = project.client.name
      timesheet.hours = 8
      timesheet.date = Date.today
    end

    it 'will create a new activity' do
      expect { timesheet.add_time }.to change { Activity.all.count }.by(1)
    end

    it 'will add an activity to the project' do
      timesheet.add_time

      expect(Activity.all.first.project).to eq(project)
    end
  end
end
