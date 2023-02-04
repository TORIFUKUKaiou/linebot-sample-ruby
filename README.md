# LINE bot

LINE botのサンプルをローカルマシンで動かす方法をまとめています。  
プログラミング言語は[Ruby](https://www.ruby-lang.org/ja/)を使っています。  
`app.rb`は、[LINE Messaging API SDK for Ruby](https://github.com/line/line-bot-sdk-ruby)の[Synopsis](https://github.com/line/line-bot-sdk-ruby#synopsis)のまんまです。

ローカルサーバーで動かせるよう、Ngrokを導入。


# [LINE Developers](https://developers.line.biz/ja/)
[LINE Developers](https://developers.line.biz/ja/)に設定が必要です。  
以下をご参照ください。  

## [Messaging APIを始めよう](https://developers.line.biz/ja/docs/messaging-api/getting-started/)

Messaging APIを始めるには、まずチャネルを作成する必要があります。チャネルの作成は2つあります、今回は[LINE Developersコンソールでチャネルを作成する](https://developers.line.biz/ja/docs/messaging-api/getting-started/#using-console)方法で設定します。

1. [LINE Developersコンソールにログインする](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-one-log-in-to-line-developers-console)  
[LINE Developersコンソール](https://developers.line.biz/console/)に各自のLINEアカウントでログインしてください。  
詳しくは、[LINE Developersコンソールへのログイン](https://developers.line.biz/ja/docs/line-developers-console/login-account/)を参照してください。

2. [開発者として登録する（初回ログイン時のみ）](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-two-register-as-developer)  
LINE Developersコンソールへの初回ログイン時は、開発者アカウントを作成する必要があります。
3. [新規プロバイダーを作成する](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-three-create-new-provider)    
プロバイダーとは、アプリを提供する組織のことです。  
ホーム画面の`新規プロバイダー作成`をクリックするか、プロバイダーを既に作成済みの場合は、`プロバイダー`セクションの`作成`をクリックして別のプロバイダーを作成してください。

4. [チャネルを作成する](https://developers.line.biz/ja/docs/messaging-api/getting-started/#step-four-create-channel)  
作成したプロバイダーページで、`チャネル設定`タブの`Messaging API`をクリックしてください。
 

## [ボットを作成する](https://developers.line.biz/ja/docs/messaging-api/building-bot/)
ボットアプリには、APIを呼び出すための`チャネルアクセストークン`と、LINEプラットフォームからWebhookペイロードを受け取るための`Webhook URL`が必要です。  
文書中[Herokuでサンプルボットを作成する](https://developers.line.biz/ja/docs/messaging-api/building-sample-bot-with-heroku/)は飛ばしてください。このリポジトリのプログラム`app.rb`を使います。

1. [チャネルアクセストークンを発行する](https://developers.line.biz/ja/docs/messaging-api/channel-access-tokens/#long-lived-channel-access-tokens)  



# 絵みたいなの

TBD  
Dockerの説明はいいとして、Ngrokの役割とかがまとまった絵があるとうれしい。  
https://excalidraw.com/ で描くのはおすすめ。  

<https://developers.line.biz/assets/img/channel.aef0b5ed.png>
の絵の`YOUR SYSTEM`がローカルマシンになっている絵

# [Docker](https://www.docker.com/) + [Ngrok](https://ngrok.com/) で動かす

```bash
docker build -t my-linebot-ruby-app .

docker run -d -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e LINE_CHANNEL_ID="165...yours" -e LINE_CHANNEL_SECRET="82a...yours" -e LINE_CHANNEL_TOKEN="wTq+...yours" -p 4567:4567 my-linebot-ruby-app

ngrok http 4567
```

[Webhook URLを設定する](https://developers.line.biz/ja/docs/messaging-api/building-bot/#setting-webhook-url)では、[Ngrok](https://ngrok.com/)に払いだされた`URL/callback`を指定してください。  

例: <https://763a-2409-252-2280-700-990d-eb8c-inoki-123da.ngrok.io/callback>  
`.ngrok.io`より前の部分は`ngrok http 4567`の都度変わります。

もしWebhook settingsの`Verify`がうまくいかない場合は、ブラウザで`http://127.0.0.1:4567/`や`http://127.0.0.1:4567/inoki-says`にアクセスしてみてください。ここにアクセスできない場合はどこかで間違っています。なにかヒントが見つかるかも知れませんので迷わずアクセスしてみてください。

![](https://developers.line.biz/assets/img/webhook-url-example-com.927fd2c9.png)


# WindowsにインストールしたRubyで直接動かす

TBD  
Windowsに[Ruby Installer](https://rubyinstaller.org/)でインストールして動かす手順。 
Windows持っているなら書いて欲しい。 
