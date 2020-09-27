class Rank < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'スタイリスト' },
    { id: 2, name: 'アシスタント' }
  ]
end
