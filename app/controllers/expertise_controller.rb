class ExpertiseController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_permissions

  def index
    if params['token'] && User.find_by_session_token(params['token'])
      @expertise = Expertise.all
      respond_with_success
    else
      respond_with_unauthorized
    end

  end

  def show
    if params['token'] && User.find_by_session_token(params['token'])
      @expertise = Expertise.find(params[:id])
      respond_with_success
    else
      respond_with_unauthorized
    end
  end

  private

  def respond_with_success
    respond_to do |format|
      format.json { render :json => @expertise.to_json(include: [:images, :specialties, :organizations, :projects, :technologies]), callback: params[:jsoncallback] }
      format.html { redirect_to('/admin') }
    end
  end

end