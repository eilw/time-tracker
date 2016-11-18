class Timesheet
  include ActiveModel::Model

  attr_accessor :project_name, :hours, :employee, :date

  def add_time
    employee.activities.create!(activity_params)
  end

  private

  def activity_params
    {
      project: project,
      hours: hours,
      date: date
    }
  end

  def project
    Project.find_by(name: project_name)
  end
end
