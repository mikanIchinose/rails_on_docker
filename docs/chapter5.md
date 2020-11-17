# レイアウトを作成する

## リンクを生成する

link_to関数を使えばアンカータグが生成される

    link_to "link text", "url"

## 画像の挿入

image_tag関数を使ってimgタグを生成できます

    image_tab('image_path', alt: 'alt text')

画像はapp/assets/images/以下に配置します｡そうすることでRailsのアセットパイプラインがファイルを探索してくれます｡

## パスの生成

コントローラーに新しくアクションを作った後にURLに紐付けるためにはroutes.rbに新しいルーティング設定を書く必要があります｡

```ruby
# 最も単純に設定するにはgetメソッドの第1引数に｢コントローラー名/アクション名｣を渡します
get 'controller_name/action_name'
=> /controller_name/action_nameにリクエストを飛ばすとcontroller_name#action_nameが実行されます

# よりRails的にするには第2引数も使います
get '/path_name', to: 'controller_name#action_name'
=> /path_nameにリクエストを飛ばすとcontroller_name#action_nameが実行されます
```

またルーティングを作ったことでヘルパーメソッドとしてpath_name_pathとpath_name_urlが生成されます｡_pathは相対パスを返し､_urlは完全なURLを返します｡

## ヘルパーメソッドをテスト環境に持ってくる

test_helper.rbというファイルにヘルパーを持ってくることでテスト環境でもヘルパーメソッドが使えるようになります

例: アプリケーションヘルパーを導入する

```ruby
class ActiveSupport::TestCase
  fixture :all
  include ApplicationHelper
end
```

## ヘルパーメソッド自身のテスト

ヘルパーメソッドをテストするにはテストファイルをtest/helpersに配置します｡
例: アプリケーションヘルパーのテスト

```ruby
require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
        base_title = "Ruby on Rails Tutorial Sample App"
        assert_equal full_title, base_title
        assert_equal full_title("Help"), "Help | #{base_title}"
    end
end
```
