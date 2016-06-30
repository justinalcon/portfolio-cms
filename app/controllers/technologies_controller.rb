class TechnologiesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_permissions

  def index
    if params['token'] && User.find_by_session_token(params['token'])
      @techs = Technology.all
      respond_with_success
    else
      respond_with_unauthorized
    end

  end

  def show
    if params['token'] && User.find_by_session_token(params['token'])
      # if there is no user for this session, unset the spark
      @techs = Technology.find(params[:id])
      respond_with_success
    else
      respond_with_unauthorized
    end
  end

  private

  def respond_with_success
    respond_to do |format|
      format.json { render :json => @techs.to_json(include: [:expertise, :organizations, :projects, :specialties]), callback: params[:jsoncallback] }
      format.html { redirect_to('/admin') }
    end
  end

end