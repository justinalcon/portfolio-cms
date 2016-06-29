
class ApiController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_permissions
  skip_before_filter :verify_authenticity_token

  def get_session
    if params['email'].blank? || params['password'].blank?
      unprocessable
      return
    else
      user = User.find_by_email(params['email'])
      if(!user.blank?) && user.valid_password?(params['password'])
        if user.session_token.blank?
          user.session_token = SecureRandom.hex
          user.save(validate: false)
        end
        response = [({message: user.session_token, user_role: user.role})]
      else
        respond_with_unauthorized
        return
      end  
    end

    render :json => response.to_json, status: :ok, callback: params['jsoncallback']
  end

  def unprocessable
    head 422
  end

end