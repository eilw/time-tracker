class Report
  include ActiveModel::Model

  attr_accessor :employee, :client, :project

  def employee_report
    Activity.where(employee: employee)
  end

  def client_report
    projects = Project.where(client: client)
    projects.map(&:activities).flatten
  end

  def project_report
    Activity.where(project: project)
  end
end
