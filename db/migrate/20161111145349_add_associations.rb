class AddAssociations < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :client, index: true, foreign_key: true
    add_reference :activities, :project, index: true, foreign_key: true
  end
end
