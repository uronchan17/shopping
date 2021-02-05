class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '札幌' },
    { id: 3, name: '千歳' },
    { id: 4, name: '函館' },
    { id: 5, name: '東北' },
    { id: 6, name: '関東' }
  ]
  include ActiveHash::Associations
  has_many :buyers
end