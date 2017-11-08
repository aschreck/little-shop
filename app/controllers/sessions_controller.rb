class SessionsController < ApplicationController
    protect_from_forgery except: [:create]

    def new

  end

  def create
    if request.env['omniauth.auth']
      user = User.find_or_create_by(uid: request.env['omniauth.auth']["uid"])
      user.provider = request.env["omniauth.auth"]["provider"]
      user.uid = request.env["omniauth.auth"]["uid"]
      user.name = request.env['omniauth.auth']["info"]["name"]
      user.oauth_token = request.env['omniauth.auth']["credentials"]["token"]
      user.oath_expires_at = Time.at(request.env['omniauth.auth']["credentials"]["expires_at"])
      user.username = request.env['omniauth.auth']["info"]["name"]
      user.password = "password"
      user.save!
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        if current_user.admin?
          redirect_to admin_dashboard_path
        else
          redirect_to dashboard_path
        end
      else
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def auth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end
end
