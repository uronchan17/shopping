class Top < ApplicationRecord
  has_one_attached :image
  has_many :buyer_tops
  has_many :buyers, through: :buyer_tops
  has_one :tops_quantity_buyer_top, -> { where(tops_quantity: true) }, class_name: 'BuyerTop'
  has_one :tops_quantity_buyer, through: :tops_quantity_buyer_top, source: :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  with_options presence: true do
    validates :items
    validates :price, numericality: { only_integer: true }
    validates :explain
    validates :category_id, numericality: { other_than: 1 }
    validates :image
  end
  validates :stock, numericality: { only_integer: true }
end
