# Ruby on Railsのサンプルアプリケーション
これは、GeekLoungeの教材内で作られたアプリケーションです。

## 使い方
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。
```
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```
その後、データベースへのマイグレーションを実行します。
```
$ rails db:migrate
```
マイグレーションが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。
```
$ rails server
```