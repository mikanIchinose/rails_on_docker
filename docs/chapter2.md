## ユーザーモデルの追加

モデルの定義
users
id: integer
name: string
email: string

microposts
id: integer
content: text
user_id: integer

一つのusersに対して複数のmicropostが対応する｡

### ユーザーモデルの実装

    rails generate scaffold User name:string email:string

上記のコマンドを使うことでrailsがモデルとCRUDルートをよしなに作ってくれる｡
モデルが定義できたのでDBを更新します｡

    rails db:migrate

`/users`にアクセスするとユーザーテーブルの情報が表示されます｡最初は何も無いのでNew Userをクリックして新規作成します｡
他には以下のようなルートが作成されています｡

```
GET
/users : index 全ユーザーの一覧表示
/users/{id} : show idで指定したユーザーを表示
/users/new : new ユーザーの新規追加画面
/users/{id}/edit : edit idで指定したユーザーの編集画面

POST
/users : create

PATCH, PUT
/users/{id} : update

DELETE
/users/{id} : destroy
```

### /users へのアクセスの流れ

1. ブラウザで/usersへのHTTPリクエストを送信
2. ルーティング機構によってusers_controller.rbのindexアクションに割り当てられる
3. Userモデル(user.rb)に全ユーザーを取得するように問い合わせる(User.all)
4. DBから取り出したユーザー一覧をコントローラーに返す
5. ユーザー一覧を@usersに格納し､ビューに返す
6. ビュー(views/users/index.html.erb)が起動しHTMLがレンダリングされる
7. コントローラーは生成されたHTMlを受け取りブラウザに返す

ルーティングについての設定は`config/routes.rb`に書きます｡

### scafoldで生成した時点での問題点

- データ検証がない: ユーザー名やメールアドレスに入力する値がなんであっても実行できてしまう
- ユーザー認証が無い: ログイン・ログアウト機構があったほうが安全
- テストがない: 無いわけではないが不十分
- レイアウトやスタイルが整っていない: サイトデザインや操作法に一貫性がない
- 理解が困難: scaffoldで自動生成されているので命令の流れが最初はわからない