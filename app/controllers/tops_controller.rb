class TopsController < ApplicationController
  def index
    @top = Top.all
    @tops = Top.new
  end
  def create
    @tops = Top.new(tops_params)
    if @tops.save
      redirect_to root_path
    else
      render :index
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
  def tops_params
    params.require(:top).permit(:items, :price, :explain, :image, :category_id).merge(stock: 0)
  end
  def stock_params
    params.require(:top).permit(:stock)
  end
end
