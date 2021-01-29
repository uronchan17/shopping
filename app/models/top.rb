class Top < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :price
    validates :explain
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
