class Buyer < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :buyer_tops
  has_many :tops, through: :buyer_tops
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :payment
  with_options presence: true do
    validates :total_fee, numericality: true
    validates :payment_id, numericality: { only_integer: true }
    validates :area_id, numericality: { only_integer: true }
  end
end
