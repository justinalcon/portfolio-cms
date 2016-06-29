require 'rails_helper'

RSpec.describe 'routes for images' do
  context 'POST create' do
    it "is not routable" do
      expect(post: 'images/images#create').not_to be_routable
    end
  end
end