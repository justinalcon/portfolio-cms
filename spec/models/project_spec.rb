require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:guinea_pig) { FactoryGirl.create(:project) }

  it 'should be valid' do
    expect(guinea_pig).to be_valid
  end

  context 'no name' do
    let(:project) { FactoryGirl.build_stubbed(:project, name: nil) }

    it 'should NOT be valid' do
      expect(project).not_to be_valid
    end
  end

end