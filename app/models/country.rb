class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '日本' },
    { id: 3, name: 'タイ' },
    { id: 4, name: '台湾' },
    { id: 5, name: '中国' },
    { id: 6, name: '韓国' },
    { id: 7, name: 'マレーシア' },
    { id: 8, name: 'インドネシア' }
  ]
  include ActiveHash::Associations
  has_many :users
end
