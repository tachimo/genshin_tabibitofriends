class HomeController < ApplicationController
  def top
    @users = User.all.order("updated_at DESC").limit(2)
  end

  def how
  end
end
