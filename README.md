# README

このアプリは、いつも選ばないようなお店との出会いを作るアプリです。
また、選択肢を絞ることで、余計に考えることなく、お店を決めることができる仕様になっています。

ターゲット（ペルソナ）
・年齢　20-30代
・性別　男性
・住んでいるところ　東京
・性格　めんどくさがり

実装した機能
・ログイン機能（sosary)
・ユーザー登録
・APIをたたいてユーザーが選んだことのないお店を紹介する機能
→APIを叩いて、ランダム。
→かぶらせないために、選んだものは、記憶させておく。
・検索結果を３個以上持っておいて配列に入れる。その配列に入っているものをシャッフルで3つ持ってきて表示
・APIで持ってきた店がかぶった場合の対処→uniqメソッドで対処
・履歴
・ログインは必須ではないが、ログインしない場合、これまで提示したことがあるお店を表示してしまうことがある。ログインするとこれまでの履歴も見れることができる。
・検索して出てきた候補はクリックするとホームページに飛ぶ仕組み-ホームページまで飛ぶと、プロフィールの履歴に帰ってきて、検索履歴にそれが加わる
・場所をフリー検索できるようにする

これから実装する機能

・（他の人が選んでいるお店）
・（履歴で選んだお店に近いお店）
・（店の様子が見れるように画像をつけるタップで他の画像も見れるようにしたい）
・reactで部分的にフロントを実装（質問にササッと答えてもらいたいため）
・1-10の間を選ぶ質問でバリデート機能によって他の値を入れれないようにする

使用したAPI
https://webservice.recruit.co.jp/doc/hotpepper/reference.html





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


