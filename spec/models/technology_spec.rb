require 'rails_helper'

RSpec.describe Technology, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:technology) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no name' do
    let(:tech) { FactoryGirl.build_stubbed(:technology, name: nil) }

    it 'should NOT be valid' do
      expect(tech).not_to be_valid
    end
  end

end