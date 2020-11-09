class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '約6ヶ月' },
    { id: 3, name: '約1歳' },
    { id: 4, name: '約1歳半' },
    { id: 5, name: '2歳〜5歳' },
    { id: 6, name: '5歳〜10歳' },
    { id: 7, name: '10歳〜15歳' },
    { id: 8, name: '15歳以上' },
  ]
end
