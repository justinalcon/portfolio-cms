class SparksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :check_permissions

  def index
    if params['token'] && User.find_by_session_token(params['token'])
      offset = params['start'] || 0
      limit = params['limit'] || 10
      params['tags'].blank? ? tag_names = [] : tag_names = params['tags'].split(',')

      tagged_spark_ids = []
      Tag.where(tag: tag_names).each do |tag|
        tag.sparks.each do |spark|
          tagged_spark_ids << spark.id
        end
      end

      if (tagged_spark_ids.blank?)
        @sparks = Spark.published.limit(limit).offset(offset)
      else
        @sparks = Spark.published.where(id: tagged_spark_ids).limit(limit).offset(offset)
      end
      respond_with_success
    else
      respond_with_unauthorized
    end

  end

  def show
    if params['token'] && User.find_by_session_token(params['token'])
      # if there is no user for this session, unset the spark
      @sparks = Spark.find(params[:id])
      respond_with_success
    else
      respond_with_unauthorized
    end
  end


  private

  def respond_with_success
    respond_to do |format|
      format.json { render :json => @sparks.to_json(include: [:tags, :images, :user]), callback: params[:jsoncallback] }
      format.html { redirect_to('/admin') }
    end
  end

end