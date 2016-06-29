require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:tag) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no tag' do
    let(:tag) { FactoryGirl.build_stubbed(:tag, tag: nil) }

    it 'should NOT be valid' do
      expect(tag).not_to be_valid
    end
  end

end