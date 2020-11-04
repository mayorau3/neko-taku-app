class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '6ヶ月' },
    { id: 3, name: '1歳' },
    { id: 4, name: '1歳半' },
    { id: 5, name: '2歳以上' },
    { id: 6, name: '5歳以上' },
    { id: 7, name: '10歳以上' },
    { id: 8, name: '15歳以上' },
  ]
end
