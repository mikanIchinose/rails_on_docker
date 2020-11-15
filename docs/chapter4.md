# Rails風味のRuby

moduleとは複数の関数をまとめる方法の一つ｡includeメソッドを使ってモジュールを読み込んでいくがrialsではヘルパーモジュールが自動的に読み込まれるような作りになっている｡

破壊的メソッド
Rubyの組み込みメソッドは非破壊的なものが基本ですが最後に!のついたメソッドは返り値でデータを上書きしてしまう破壊的メソッドです｡

配列の末尾への要素追加
pushメソッドか<<演算子を使う

## ハッシュとシンボル

ハッシュは他の言語の連想配列や辞書に対応する｡

### 特徴

インデックスに整数以外を取ることができる｡
並び順は基本的に保証されない

```ruby
user = {}
user['first_name'] = 'Michael'
user['last_name'] = 'Hartl'

# リテラルはPHPの連想配列に近い
=> {'first_name'=>'Michael', 'last_name'=>'Hartl'}

# Rubyではインデックスにシンボルを使うことが多い
user1 = {:name => 'Michael Hartl', :email => 'michael@example.com'}

# JSのオブジェクトに近い
user2 = {name: 'Peter', email: 'peter@example.com'}
# `name:`という記法はあくまで`:name=>`のシンタックスシュガーなので単体では成立しません
```

Rubyの関数呼び出し時に引数を括弧で囲まなくても評価される｡
またハッシュが引数の場合波括弧を省略することができます｡

```ruby
stypesheet_link_tag 'application', media: 'all',
                                   'data-turbolinks-track': 'reload'
```

## クラス

(インスタンス).classと書くとどのクラスのインスタンスであるかを返す｡またsuperclassをチェーンでつなぐことで継承クラスを探すこともできる｡

```ruby
>> user = User.new
=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>
>> user.class
=> User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime)
>> user.class.superclass
=> ApplicationRecord(abstract)
>> user.class.superclass.superclass
=> ActiveRecord::Base
>> user.class.superclass.superclass.superclass
=> Object
>> user.class.superclass.superclass.superclass.superclass
=> BasicObject
>> user.class.superclass.superclass.superclass.superclass.superclass
=> nil
```

### クラス定義

```ruby
class User
    # インスタンス変数に対してゲッターとセッターを準備します
    attr_accessor :first_name, :last_name, :email

    # コンストラクタ
    def initialize(attributes = {})
        @first_name = attributes[:first_name]
        @last_name = attributes[:last_name]
        @email = attributes[:email]
    end

    def full_name
        "#{@first_name} #{@last_name}"
    end

    def formatted_email
        "#{full_name} #{@email}"
    end
end
```