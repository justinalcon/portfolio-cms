class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end

  before_action :authenticate_user!
  before_action :check_permissions
  before_action :set_current_user

  def set_current_user
    Thread.current.thread_variable_set(:current_user, current_user)
  end

  def after_sign_in_path_for(user)
    "/admin"
  end

  private

  def respond_with_unauthorized
    head :unauthorized
  end

  def check_permissions

    if request.env['PATH_INFO'] == "/users/login" || request.env['PATH_INFO'] == "/users/password" || request.env['PATH_INFO'] == "/users/password/new" || request.env['PATH_INFO'] == "/users/password/edit"
      return
    end

    action = params[:action]
    model = params[:model_name]
    role = current_user.role

    case role
      when User::ROLE_ADMIN
        return

      when User::ROLE_TECH
      when User::ROLE_NONTECH
        if action == "edit" && model == "user"
          id = request.env['PATH_INFO'].split('/').third
          unless id == current_user.id
            flash[:notice] = "You dont have permission to see this page"
            redirect_to("/admin")
          end
          return
        end

        if action == "edit" && model == "spark"
          id = request.env['PATH_INFO'].split('/').third

          unless Spark.find(id).user_id == current_user.id
            flash[:notice] = "You dont have permission to see this page"
            redirect_to("/admin")
          end
          return
        end

      else
        flash[:notice] = "User role not recognized"
        redirect_to("/users/login")
    end

  end

end
