class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :employee

  validates :project, presence: true
  validates :employee, presence: true
  validates :hours, presence: true
  validates :date, presence: true
end
