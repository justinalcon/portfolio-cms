require 'rails_helper'

RSpec.describe 'routes for users' do
  context 'GET index' do
    it "is not routable" do
      expect(get: 'rails_admin/main#dashboard').not_to be_routable
    end
  end
end