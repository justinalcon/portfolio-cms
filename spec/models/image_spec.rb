require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:image) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no location' do
    let(:image) { FactoryGirl.build_stubbed(:image, location: nil) }

    it 'should NOT be valid' do
      expect(image).not_to be_valid
    end
  end

end