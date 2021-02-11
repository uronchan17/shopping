class UserPayment
  include ActiveModel::Model
  attr_accessor :area_id, :total_fee, :payment_id, :delivery_fee_id, :user_id, :items, :price, :explain, :image, :category_id, :stock, :buy

  with_options presence: true do
    validates :price
    validates :explain
    validates :image
  end
  
  def save
    # トータル価格の計算
    total_fee = 0
    buy.each{|key,value|
      price_one = Top.find(key)
      quantity_price = price_one.price * value.to_i
      total_fee += quantity_price
      }
    # 購入商品リスト
    list = []
    quantity = []
    buy.each{|key,value|
      list << key.to_i
      quantity << value.to_i
      }
    Buyer.create(area_id: area_id, payment_id: payment_id, user_id: user_id, total_fee: total_fee, image: image, top_ids: list)
    last = BuyerTop.last
    last_buyer_id = last.buyer_id
    buyerid = BuyerTop.where("buyer_id = #{last_buyer_id}")
    i = 0
    buyerid.each do | buy |
      buy.tops_quantity = quantity[i]
      buy.save
      i += 1
    end
    # 在庫数の変動
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