# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_session , only: %i[show]
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

  def new_session; 
  end

  def create_session
    c_user = User.find_by(username: params['username'])
    if c_user.nil?
      @error = "User name doesn't exists"
      render 'new_session'
    else
      session[:user_id] = c_user.id
      redirect_to user_path(c_user.id)
    end
  end

  def destroy_session
    session[:user_id] = nil
    redirect_to new_session_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :username, :last_name, :email, :avatar)
  end

  def check_session
    if session[:user_id].nil?
      redirect_to new_session_users_path
    end
  end
end
