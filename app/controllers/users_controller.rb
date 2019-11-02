class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit ,:update]
  before_action :correct_user, only: [:edit,:update]
  def show
    @user=User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user=User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '名前 は正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '名前 は更新されませんでした'
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def correct_user
    @user = User.find_by(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
