class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buyers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  with_options presence: true do
    validates :nickname
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :country_id, numericality: { other_than: 1 }
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :country
end
