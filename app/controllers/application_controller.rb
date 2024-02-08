# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_signin
    return if current_user

    session[:inteded_url] = request.url
    redirect_to new_session_url, alert: 'Please sign in!'
  end

  def require_admin
    return if current_user.admin?

    redirect_to root_path, alert: 'Unauthorized access!'
  end

  helper_method :current_user
end
