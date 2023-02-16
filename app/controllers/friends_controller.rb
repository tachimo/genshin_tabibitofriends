class FriendsController < ApplicationController
  def top
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    @users = User.all
    @users = @users.page(params[:page])
  end
end
