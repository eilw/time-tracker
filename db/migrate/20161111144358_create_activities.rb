class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.date :date
      t.float :hours

      t.timestamps
    end
  end
end
