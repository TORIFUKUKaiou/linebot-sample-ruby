# インターンシップ(2days) LINE bot作成講座資料

LINE botのサンプルをローカルマシンで動かす方法をまとめています。  
プログラミング言語は[Ruby](https://www.ruby-lang.org/ja/)を使っています。  
`app.rb`は、[LINE Messaging API SDK for Ruby](https://github.com/line/line-bot-sdk-ruby)の[Synopsis](https://github.com/line/line-bot-sdk-ruby#synopsis)のまんまです。

# 概要



# Installing / Getting started
## 環境構築
### [Ruby](https://www.ruby-lang.org/ja/)
```shell
ruby -v 
```

### [Ngrok](https://ngrok.com/)の導入、実行
ローカルサーバーで動かせるよう、Ngrokを導入します。
```shell
# Ngrokをインストール
brew install ngrok/ngrok/ngrok
# 確認('Ctrl + C'で停止)
ngrok http 4567
```

## [LINE Developers](https://developers.line.biz/ja/)準備
LINE APIを使用するために、LINE Developersに設定が必要です。
<details><summary>LINE Developersコンソールにログインする</summary>
  
1. [LINE Developersコンソール](https://developers.line.biz/console/)に各自のLINEアカウントでログインしてください。  

2. 開発者として登録する（初回ログイン時のみ）
LINE Developersコンソールへの初回ログイン時は、開発者アカウントを作成する必要があります。

詳しくは、[LINE Developersコンソールへのログイン](https://developers.line.biz/ja/docs/line-developers-console/login-account/)を参照してください。
</details>

<details><summary>Messaging API チャネルの作成</summary>
  
1. [新規プロバイダーを作成する](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-three-create-new-provider)    
プロバイダーとは、アプリを提供する組織のことです。  
コンソール（ホーム）画面の`新規プロバイダー作成`をクリックするか、プロバイダーを既に作成済みの場合は、`プロバイダー`セクションの`作成`をクリックして別のプロバイダーを作成してください。

2. [チャネルを作成する](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-four-create-channel)  
作成したプロバイダーページで、`チャネル設定`タブの`Messaging API`をクリックしてください。

詳しくは、[Messaging APIを始めよう](https://developers.line.biz/ja/docs/messaging-api/getting-started/)を参照してください。

</details>

<details><summary>友達追加</summary>
  
  `Messaging API設定`タブの`ボット情報`セッションにQRコードがあるので、スキャンして友だち登録しておいてください。
</details>

<details><summary>「応答メッセージ」と「あいさつメッセージ」の設定</summary>
  
`Messaging API設定`タブの`LINE公式アカウント機能`セッションで`応答メッセージ`と`あいさつメッセージ`を`無効`に設定してください。  
Messaging APIを使うときは、これの設定が`無効`である必要があります。
</details>

<details><summary>チャネルアクセストークンの発行</summary>
  
`Messaging API設定`タブ最下部の`チャネルアクセストークン`セッションで、チャネルアクセストークンを発行してください。
</details>





　


# [ボットを作成する](https://developers.line.biz/ja/docs/messaging-api/building-bot/)
ボットアプリには、APIを呼び出すための`チャネルアクセストークン`と、LINEプラットフォームからWebhookペイロードを受け取るための`Webhook URL`が必要です。  

## [Webhook URLを設定する](https://developers.line.biz/ja/docs/messaging-api/building-bot/#setting-webhook-url)

1. 先ほどNgorkに払い出された`Forwarding`のURLをコピー 
![ngorkの実行結果](images/ngork_output.png "ngrok")
例: <https://ecba-106-185-151-251.jp.ngrok.io/callback>  
`.ngrok.io`より前の部分は`ngrok http 4567`の都度変わります。

2. `Messaging API設定`タブの`Webhook URL`セッションで
`1でコピーしたURL + /callback`を指定してください。  
![webhookの設定](images/webhook_setting.png "webhook")
`検証`をクリックして`成功`が返ってきたらOK。
また、この時`Webhookの利用`が`ON`に設定してください。

もしWebhook settingsの`検証`がうまくいかない場合は、ブラウザで`http://127.0.0.1:4567/`や`http://127.0.0.1:4567/inoki-says`にアクセスしてみてください。ここにアクセスできない場合はどこかで間違っています。なにかヒントが見つかるかも知れませんので迷わずアクセスしてみてください。

# [Docker](https://www.docker.com/) + [Ngrok](https://ngrok.com/) で動かす

```bash
docker build -t my-linebot-ruby-app .

docker run -d -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e LINE_CHANNEL_ID="165...yours" -e LINE_CHANNEL_SECRET="82a...yours" -e LINE_CHANNEL_TOKEN="wTq+...yours" -p 4567:4567 my-linebot-ruby-app

ngrok http 4567
```




# WindowsにインストールしたRubyで直接動かす

TBD  
Windowsに[Ruby Installer](https://rubyinstaller.org/)でインストールして動かす手順。 
Windows持っているなら書いて欲しい。 
