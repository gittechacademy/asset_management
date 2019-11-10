class StocksController < ApplicationController
  before_action :correct_user, only: [:edit,:update,:destroy]
  before_action :bland_correct_user,only:[:buy,:sell]
  def new
  end

  def edit
    @buysell=Buysell.all
    @stock=Stock.find(params[:id])
    @bland=Bland.find(@stock.bland_id)
  end

  def update
    @stock=Stock.find(params[:id])    
    if @stock.update(stock_params)
      flash[:success] = '正常に更新されました'
      redirect_to blands_user_path(current_user)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def create
    @bland=Bland.find(params[:stock][:bland_id])
    @stock=@bland.stocks.build(stock_params)
    if @stock.save
      flash[:success] = '登録しました。'
      redirect_to blands_user_path(current_user)
    else
     @blands=current_user.blands.order(id: :desc).page(params[:page])
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @stock=Stock.find(params[:id])
    @stock.destroy
    flash[:success] = '正常に削除されました'
    redirect_to blands_user_path(current_user)

  end
  
  def buy
    @buysell=Buysell.all
    @user=User.find(current_user.id)
    @bland=Bland.find(params[:id])
    @stock=@bland.stocks.build(bland_id:params[:id],buying_and_selling:0)
  end
  
  def sell
    @buysell=Buysell.all
    @user=User.find(current_user.id)
    @bland=Bland.find(params[:id])
    @stock=@bland.stocks.build(bland_id:params[:id],buying_and_selling:1)
  end
  
  private
  
  def stock_params
    params.require(:stock).permit(:number,:money,:buying_and_selling)
  end
  def bland_correct_user
    @bland=Bland.find(params[:id])
    unless @bland.user_id===current_user.id
      redirect_to root_url
    end
  end
  
  def correct_user
    @user=Bland.find(Stock.find(params[:id]).bland_id)
    unless @user.user_id===current_user.id
      redirect_to root_url
    end
  end
end