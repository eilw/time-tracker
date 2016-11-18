require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to belong_to :client }
  it { is_expected.to have_many :activities }
  it { should validate_presence_of(:client) }
  it { should validate_presence_of(:name) }
end
