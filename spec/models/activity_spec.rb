require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :project }
    it { is_expected.to belong_to :employee }

    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:employee) }
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:date) }
  end
end
