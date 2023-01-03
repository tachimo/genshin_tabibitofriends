class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(user_path(@user), notice: 'ログインに成功しました')
    else
      flash[:notice] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました。')
  end
end
