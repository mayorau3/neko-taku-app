class CatHistory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1年未満' },
    { id: 3, name: '1年以上' },
    { id: 4, name: '3年以上' },
    { id: 5, name: '5年以上' },
    { id: 6, name: '10年以上' },
    { id: 7, name: 'なし' }
  ]
end
