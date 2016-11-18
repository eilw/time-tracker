class TimesheetsController < ApplicationController
  before_action :authenticate_employee!

  def new
    @timesheet = Timesheet.new
  end

  def add_time
    timesheet = Timesheet.new(timesheet_params)
    timesheet.add_time

    redirect_to new_timesheet_path
  end

  private

  def timesheet_params
    params.require(:timesheet).permit(:project_name, :hours, :date, :new_project_name, :client_name, :new_client_name).merge(employee: current_employee)
  end
end
