class DividendsController < ApplicationController
  def show
  end

  def new
    @months = Month.all    
    @user=User.find(current_user.id)
    @bland=Bland.find(params[:format])
    @dividend=@bland.dividends.build(bland_id:params[:format])
  end

  def create
    @months = Month.all 
    @bland=Bland.find(params[:dividend][:bland_id])
    @dividend=@bland.dividends.build(dividend_params)
    if @dividend.save
      flash[:success] = '登録しました。'
      redirect_to blands_user_path(current_user)
    else
      @dividend=@bland.dividends.build(dividend_params)
      flash.now[:danger] = '登録に失敗しました。'      
      render :new
    end
  end

  def edit
    @months = Month.all
    
    @dividend=Dividend.find(params[:id])
  end

  def update
    @dividend=Dividend.find(params[:id])
    if @dividend.update(dividend_params)
      flash[:success] = '正常に更新されました'
      redirect_to blands_user_path(current_user)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @dividend=Dividend.find(params[:id])
    @dividend.destroy
    flash[:success] = '正常に削除されました'
    redirect_to blands_user_path(current_user)
  end
  
  private

  def dividend_params
    params.require(:dividend).permit(:money,:month)
  end
end
