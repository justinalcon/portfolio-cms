require 'rails_helper'

RSpec.describe ApiController, type: :controller do

  let!(:user) { FactoryGirl.create(:user) }
  context 'POST #get_session' do
    context 'parmas are valid' do
      context 'parmas are legit' do
        before do
          post :get_session, email: user.email, password: user.password
        end

        it 'succeeds' do
          expect(response).to have_http_status(:ok)
        end
        context 'user had token' do
          let!(:user) { FactoryGirl.create(:user, session_token: 'AnExistingLegitToken') }
          let!(:original_token) { user.session_token }
          before do
            post :get_session, email: user.email, password: user.password
          end

          it 'does not update the token' do
            user.reload
            expect(user.session_token).to eq(original_token)
          end
        end
        context 'user had blank token' do
          let!(:user) { FactoryGirl.create(:user, session_token: '') }
          let!(:original_token) { user.session_token }
          before do
            post :get_session, email: user.email, password: user.password
          end

            it 'does not update the token' do
            user.reload
            expect(user.session_token).not_to eq(original_token)
            end
        end
        context 'user had nil token' do
          let!(:user) { FactoryGirl.create(:user, session_token: nil) }
          let!(:original_token) { user.session_token }
          before do
            post :get_session, email: user.email, password: user.password
          end

          it 'does not update the token' do
            user.reload
            expect(user.session_token).not_to eq(original_token)
          end
        end
      end
      context 'parmas are NOT legit' do
        before do

          post :get_session, email: user.email, password: 'someGarbageThatAintThepassword'
        end

        it 'responds unauthorized' do
          expect(response).to have_http_status(:unauthorized)
        end

      end
    end


    context 'params are NOT valid' do
      before do
        post :get_session, email: user.email
      end

      it 'responds unprocessable' do
        expect(response).to have_http_status(422)
      end

    end
  end
end

