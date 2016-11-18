class Project < ApplicationRecord
  belongs_to :client
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :client, presence: true
end
