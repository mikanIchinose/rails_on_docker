# レイアウトを作成する

## リンクを生成する

link_to関数を使えばアンカータグが生成される

    link_to "link text", "url"

## 画像の挿入

image_tag関数を使ってimgタグを生成できます

    image_tab('image_path', alt: 'alt text')

画像はapp/assets/images/以下に配置します｡そうすることでRailsのアセットパイプラインがファイルを探索してくれます｡