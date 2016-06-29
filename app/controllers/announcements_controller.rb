class AnnouncementsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_permissions

  def index
    if params['token'] && User.find_by_session_token(params['token'])
      @announcements = Announcement.all
      respond_with_success
    else
      respond_with_unauthorized
    end
  end

  def show
    if params['token'] && User.find_by_session_token(params['token'])
      @announcements = Announcement.find(params[:id])
      respond_with_success
    else
      respond_with_unauthorized
    end

  end

  private

  def respond_with_success
    respond_to do |format|
      format.json { render :json => @announcements }
      format.html
    end
  end
end