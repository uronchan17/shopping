class TopsController < ApplicationController
  def index
    @top = Top.all
    @tops = Top.new
    @buy = Buyer.new
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
    @top = Top.find(params[:id])
    @tops = Top.new(stock_params)
    @top.increment(:stock, @tops.stock)
    @top.save
    redirect_to root_path
  end

  private

  def stock_params
    params.require(:top).permit(:stock)
  end

  def user_payment_params
    params.require(:user_payment).permit!
  end
end
