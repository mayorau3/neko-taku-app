function preview(){
  const ImageList2 = document.getElementById('image-list2');
  if (!ImageList2) {
    return;
  }
  // 選択した画像を表示する関数
  const createImageHTML = (blob) => {
    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');
    imageElement.setAttribute('id', "image-element");
    let imageElementNum = document.querySelectorAll('#image-element').length;
    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('class', "image-preview w-75");
    blobImage.setAttribute('src', blob);
    // ファイル選択ボタンを生成
    const inputHTML = document.createElement('input');
    inputHTML.setAttribute('id', `cat_image_${imageElementNum}`);
    inputHTML.setAttribute('name', 'cat[images][]');
    inputHTML.setAttribute('type', 'file');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    imageElement.appendChild(inputHTML)
    ImageList2.appendChild(imageElement);

    inputHTML.addEventListener('change', (e) => {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    })
  };

  document.getElementById('cat-image').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
}
document.addEventListener('DOMContentLoaded',preview);