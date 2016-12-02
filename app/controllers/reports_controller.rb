class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def employee
    @report = Report.new(report_params)
  end

  def client
    report = Report.new(report_params)
    @activities = report.client_report
  end

  def project
    report = Report.new(report_params)
    @activities = report.project_report
  end

  private

  def report_params
    params.require(:report).permit(:employee, :client, :project, :date_from, :date_to)
  end
end
