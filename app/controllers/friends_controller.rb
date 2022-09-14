class FriendsController < ApplicationController
  def top
    @users = User.all
  end
end
