class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'お菓子' },
    { id: 3, name: '化粧品' },
    { id: 4, name: '海鮮' },
    { id: 5, name: '雑貨' },
    { id: ６, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :category
end