class Report
  include ActiveModel::Model

  attr_accessor :employee, :client, :project, :date_from, :date_to

  def client_report
    projects = Project.where(client: client)
    projects.map(&:activities).flatten
  end

  def project_report
    Activity.where(project: project)
  end

  def date_range
    (Date.parse(date_from)..Date.parse(date_to)).to_a
  end

  def filled_in?(date)
    activity_dates.include?(date)
  end

  private

  def activity_dates
    @_employee_dates ||= Activity.where(employee: employee, date: date_from..date_to).pluck(:date)
  end
end
