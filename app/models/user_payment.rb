class UserPayment
  include ActiveModel::Model
  attr_accessor :area_id, :total_fee, :payment_id, :user_id, :items, :price, :explain, :image, :category_id, :stock, :buy

  with_options presence: true do
    validates :price, numericality: true
    validates :explain
    validates :image
    validates :area_id, numericality: { only_integer: true }
  end

  def save
    # トータル価格の計算
    total_fee = 0
    buy.each do |key, value|
      price_one = Top.find(key)
      quantity_price = price_one.price * value.to_i
      total_fee += quantity_price
    end
    # 購入商品リスト
    list = []
    quantity = []
    buy.each do |key, value|
      list << key.to_i
      quantity << value.to_i
    end
    Buyer.create(area_id: area_id, payment_id: payment_id, user_id: user_id, total_fee: total_fee, image: image, top_ids: list)
    last = BuyerTop.last
    last_buyer_id = last.buyer_id
    buyerid = BuyerTop.where("buyer_id = #{last_buyer_id}")
    i = 0
    buyerid.each do |buy|
      buy.tops_quantity = quantity[i]
      buy.save
      i += 1
    end
    # 在庫数の変動
    buy.each do |key, value|
      shipment = Top.find(key)
      ship = Top.new(stock: value)
      shipment.decrement(:stock, ship.stock)
      shipment.save
    end
  end

  def save_top
    Top.create(items: items, price: price, explain: explain, image: image, category_id: category_id, stock: 0)
  end
end
