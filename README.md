# 🎂ながのCAKE

**長野県にある小さな洋菓子点「ながのCAKE」の商品を通販するためのECサイト**

## 🎥動作GIF
![nagano](https://user-images.githubusercontent.com/80461169/119246090-7919a600-bbb9-11eb-80b0-bf40365d15fe.gif)


## ❔サイト概要
**Nagano Cake**は、昨年からInstagramを開設し、全国のお客様からご注文をいただくようになりました。そこで、Instagramのアカウントをお持ちでないお客様もご購入いただけるようなホームページを開設しました。

## 🟥使っている言語やフレームワークのバージョン

* OS ： Linux（CentOS）
* 言語 : HTML,SCSS,JavaScript,Ruby
* フレームワーク : Ruby on Rails, Bootstrap
* JSライブラリ : jQuery
* IDE : Cloud9

## 💻環境構築に必要な手順
```
$ git clone 
$ cd nagano_cake
$ bundle
$ rails db:migrate
$ rails db:seed
$ rails s
```

* 👮‍管理者ログイン 〜/admin/sign_in
* 📩メールアドレス admin@admin
* 🔑パスワード　adminadmin

## 🎁実装機能
### 顧客側
新規登録/ログイン/ログアウト/退会（論理削除）

Topページ/Aboutページ

会員情報詳細/会員情報編集

商品一覧/商品詳細

カート情報一覧表示/カート追加/カート内削除、全削除

注文情報入力/注文履歴一覧表示/注文詳細

配送先情報一覧登録、削除/配送先情報編集

### 管理者側
ログイン/ログアウト

商品情報登録/商品詳細/商品編集

会員情報一覧/会員情報編集

注文履歴一覧/注文詳細一覧/注文履歴編集

ジャンル登録/ジャンル編集

## 📕設計書
### ER図
<img width="911" alt="スクリーンショット 2021-05-21 16 14 25" src="https://user-images.githubusercontent.com/80461169/119103067-b36a3280-ba55-11eb-9da3-507c141dbfe7.png">

### 顧客側ルーティング
<img width="495" alt="スクリーンショット 2021-05-21 16 11 55" src="https://user-images.githubusercontent.com/80461169/119103092-ba914080-ba55-11eb-8eed-1f49bf13f332.png">

### 管理者側ルーティング
<img width="495" alt="スクリーンショット 2021-05-21 16 10 03" src="https://user-images.githubusercontent.com/80461169/119103101-bcf39a80-ba55-11eb-8277-f40297e391bf.png">


## 🐼パンダマグロのメンバー🍣
[しんや](https://github.com/orgs/pandamaguro/people/shinyarie)
[こーきち](https://github.com/orgs/pandamaguro/people/Kokichi3569)
[けんと](https://github.com/orgs/pandamaguro/people/Kokichi3569)
[とも](https://github.com/orgs/pandamaguro/people/tomofumi-run)
