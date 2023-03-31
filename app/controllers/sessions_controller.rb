# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user_info = request.env['omniauth.auth']
    @user = User.find_by(twitter_id: user_info['uid']) || User.create_with_omniauth(user_info)

    @user.update(
      token: user_info['credentials']['token'],
      refresh_token: user_info['credentials']['refresh_token'],
      expires_at: Time.at(user_info['credentials']['expires_at']).to_datetime
    )

    session[:user_id] = @user.id
    render json: @user
    # redirect_to '/bookmarks', notice: 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out!'
  end
end
