class Timesheet
  include ActiveModel::Model

  attr_accessor :project_name, :hours, :employee, :date, :new_project_name, :client_name, :new_client_name

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
    if project_name.blank?
      Project.create!(name: new_project_name, client: client)
    else
      Project.find_by(name: project_name)
    end
  end

  def client
    if client_name.blank?
      Client.create!(name: new_client_name)
    else
      Client.find_by(name: client_name)
    end
  end
end
