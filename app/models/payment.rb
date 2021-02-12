class Payment < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '現金' },
    { id: 3, name: 'クレジット' }
  ]
  include ActiveHash::Associations
  has_many :buyers
end
