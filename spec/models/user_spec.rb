require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  it 'should be valid' do
    expect(user).to be_valid
  end

  context 'no email' do
    let(:user) { FactoryGirl.build_stubbed(:user, email: nil) }

    it 'should NOT be valid' do
      expect(user).not_to be_valid
    end
  end
end