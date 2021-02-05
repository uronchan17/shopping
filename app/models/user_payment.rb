class UserPayment
  include ActiveModel::Model
  attr_accessor :area_id, :total_fee, :payment_id, :delivery_fee_id, :user_id, :items, :price, :explain, :image, :category_id, :stock, :buy

  with_options presence: true do
    validates :price
    validates :explain
    validates :image
  end
  
  def save
    Buyer.create(area_id: area_id, payment_id: payment_id,)
    buy.each{|key,value|
      shipment = Top.find(key)
      ship = Top.new(stock: value)
      shipment.decrement(:stock, ship.stock)
      shipment.save}
  end

  def save_top
    Top.create(items: items, price: price, explain: explain, image: image, category_id: category_id, stock: 0)
  end
end