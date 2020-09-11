# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_users_path
    else
      render 'new'
    end
  end

  def show
    @events = helpers.current_user.created_events
  end

  def edit; end

  def update; end

  def new_session; end

  def create_session
    c_user = User.find_by(username: params['username'])
    if c_user.nil?
      render 'new_session'
    else
      session[:user_id] = c_user.id
      redirect_to user_path(c_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :username, :last_name, :email, :avatar)
  end
end
