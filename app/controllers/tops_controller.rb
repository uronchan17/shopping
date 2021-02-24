class TopsController < ApplicationController
  def index
    @top = Top.all
    @tops = Top.new
    @buy = Buyer.new
    @buyer = Buyer.all.order('created_at DESC')
    @user_payment = UserPayment.new
  end

  def create
    if params[:user_payment].has_key?(:items)
      @user_payment = UserPayment.new(user_payment_params)
      @user_payment.save_top
      redirect_to root_path
    else
      @user_payment = UserPayment.new(user_payment_params)
      @user_payment.save
      redirect_to root_path
    end
  end

  def update
    if params.has_key?(:buyer)
      @buy = Buyer.find(params[:id])
      @buys = Buyer.new(check_params)
      @buy.check1 = @buys.check1
      @buy.save
      redirect_to root_path
    else
      @top = Top.find(params[:id])
      @tops = Top.new(stock_params)
      @top.increment(:stock, @tops.stock)
      @top.save
      redirect_to root_path
    end
  end

  def show
    @top = Top.find(params[:id])
  end


  private

  def stock_params
    params.require(:top).permit(:stock)
  end

  def check_params
    params.require(:buyer).permit(:check1)
  end

  def user_payment_params
    params.require(:user_payment).permit!.merge(user_id: current_user.id)
  end
end
