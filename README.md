FishingRecords
===

製作者のchihaと申します。日本語で失礼致します。

# 概要
アプリケーション名：FishingRecords
URL：https://fishing-records.herokuapp.com/
アプリ概要：ユーザー認証機能、投稿機能（釣果、釣り場）、投稿検索機能、詳細表示機能（googlemap付き）
アプリケーショントップページにてスクリーンショット付きの概要を表示しています。
https://qiita.com/chiha-chiha/items/3226bdd83b3d4c974e7e
こちらに一部コードの説明を書いてます。

# 開発環境
- MacOS MOjave 10.14.5
- Ruby on Rails 5.2.2
- Ruby 2.5.1
- jQuery
- 開発・テスト　MySQL
- 本番　PostgreSQL
- デプロイ　heroku
- herokuの画像アップロード　Amazon S3

## seedデータ
rake db:migrate後、初期データとして以下のコマンドを実行してください

魚のデータ導入

```
$ bundle exec rake db:seed:scraping
```

県、市区町村のデータ導入

```
$ bundle exec rake db:seed:prefecture
```

釣れた時間帯の選択肢データ導入

```
$ bundle exec rake db:seed:hours
```
※こちらのコマンドで2000個のダミー投稿（全ての項目がランダム生成）を作成します。検索フォームの動作確認等必要に応じて入力してください。

```
$ bundle exec rake db:seed:dummy
```

# データベース設計

![erd](https://user-images.githubusercontent.com/53557469/66914995-f29ef900-f052-11e9-85bf-c365d16bef82.png)



