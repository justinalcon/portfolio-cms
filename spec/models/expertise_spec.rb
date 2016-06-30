require 'rails_helper'

RSpec.describe Expertise, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:expertise) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no name' do
    let(:expertise) { FactoryGirl.build_stubbed(:expertise, name: nil) }

    it 'should NOT be valid' do
      expect(expertise).not_to be_valid
    end
  end

end