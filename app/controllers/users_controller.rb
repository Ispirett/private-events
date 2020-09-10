# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    byebug
  end

  def show; end

  def edit; end

  def update; end

  def new_session; end

  def create_session
    c_user = User.find_by(username: params['username'])
    if c_user.nil?
      render new_session
    else
      Session[:user_name] = c_user.username
    end
  end
end
