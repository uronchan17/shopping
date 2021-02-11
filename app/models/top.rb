class Top < ApplicationRecord
  has_one_attached :image
  has_many :buyer_tops
  has_many :buyers, through: :buyer_tops
  has_one :tops_quantity_buyer_top, -> {where(tops_quantity: true)}, class_name: 'BuyerTop'
  has_one :tops_quantity_buyer, through: :tops_quantity_buyer_top, source: :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
