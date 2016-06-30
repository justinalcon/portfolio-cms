require 'rails_helper'

RSpec.describe Specialty, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:specialty) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no name' do
    let(:specialty) { FactoryGirl.build_stubbed(:specialty, name: nil) }

    it 'should NOT be valid' do
      expect(specialty).not_to be_valid
    end
  end

end