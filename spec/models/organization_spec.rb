require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:organization) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no name' do
    let(:organization) { FactoryGirl.build_stubbed(:organization, name: nil) }

    it 'should NOT be valid' do
      expect(organization).not_to be_valid
    end
  end

end