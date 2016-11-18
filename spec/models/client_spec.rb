require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :projects }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
