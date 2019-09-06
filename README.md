FishingRecords
===

日本語で失礼します。
当アプリはユーザー登録、釣果、釣り場投稿、投稿検索機能を実装したwebアプリケーションです。

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

