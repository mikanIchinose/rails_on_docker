# ユーザー登録

## デバッグ情報を出す

ビルトインのdebug関数を使うとビューにデバッグ情報を乗せることができます｡

```erb
# views/layouts/application.html.erb
<%= debug(params) if Rails.env.development? %>
# if文を入れることで開発環境のときにのみデバッグ情報を出すようになります
```

### byebugを使った直接的デバッグ

byebugというGemを入れていればdebuggerというメソッドが使えるようになります｡
このメソッドをコードの好きな場所に差し込んでそこをブレイクポイントにすることができます｡
確認するにはコンソールを使います｡`rails s`したターミナルを開いた状態を見ます｡
debuggerのある行に処理が到達するとそこで一時中断され､ターミナルがデバッグ状態であることが示されます｡

```bash
[9, 18] in /app/app/controllers/users_controller.rb
    9:
   10:   # GET /users/1
   11:   # GET /users/1.json
   12:   def show
   13:     debugger
=> 14:   end
   15:
   16:   # GET /users/new
   17:   def new
   18:     @user = User.new
(byebug) puts "hello"
hello
nil
(byebug) @user
```

デバッグを終了するにはC-dです｡

dockerで開発を行っている場合は操作が異なります｡
まず`docker-composer.yaml`に以下の追記を行ってください｡

```yaml
stdin_open: true
tty: true
```

次にRailsアプリケーションを立ち上げているコンテナにアタッチします｡

```bash
docker-compose attach rails_on_docker_web_1(コンテナ名)
```

するとRailsのログが見れるのであとはdebuggerを配置して処理がそこに到達すればデバッグ開始です｡
デタッチの仕方に注意してくださいC-cをおすとコンテナを停止させてしまうので`C-p C-q`を押します｡

## RESTfulなリソースの作成

```ruby
resources :users
```

と書くことでRESTfulなUserリソースに必要な名前付きルートとアクションが利用できるようになる

```ruby
# 2つのコードは同じ振る舞いをする
redirect_to user_path(@user)
redirect_to @user
```

アクションが指定したリダイレクト先に強制的に移動させるには`follow_redirect!`メソッドを使う
