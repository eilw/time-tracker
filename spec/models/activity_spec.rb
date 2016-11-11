require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :project }
    it { is_expected.to belong_to :employee }
  end
end
