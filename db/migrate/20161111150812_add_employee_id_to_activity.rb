class AddEmployeeIdToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :employee, index: true, foreign_key: true
  end
end
