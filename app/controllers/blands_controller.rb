class BlandsController < ApplicationController
  before_action :correct_user, only: [:new,:edit,:create,:update,:destroy]
  def create
    @type_names = TypeName.all
    @bland=current_user.blands.build(bland_params)
    if @bland.save
      flash[:success] = '銘柄を登録しました。'
      redirect_to user_path(current_user)
    else
     @blands=current_user.blands.order(id: :desc).page(params[:page])
      flash.now[:danger] = '銘柄の登録に失敗しました。'
      render :new
    end
  end

  def new
    @type_names = TypeName.all
    @bland = current_user.blands.build
  end

  def edit
    @type_names = TypeName.all
    @bland=Bland.find(params[:id])
  end

  def show
    #@stocks=@blands.stocks.order(id: :desc).page(params[:page])
  end

  def update
    @type_names = TypeName.all
    @bland=current_user.blands.find(params[:id])
    if @bland.update(bland_params)
      flash[:success] = '銘柄は正常に更新されました'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = '銘柄は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @bland=current_user.blands.find(params[:id])
    @bland.destroy
    flash[:success] = '銘柄は正常に削除されました'
    redirect_back(fallback_location: root_path) 
  end
   private

  def bland_params
    params.require(:bland).permit(:name,:code,:type_name_id)
  end
  def correct_user
    @bland = current_user.blands.find_by(params[:id])
    unless @bland
      redirect_to root_url
    end
  end
end
