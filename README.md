# LINE bot

LINE botのサンプルをローカルマシンで動かす方法をまとめています。  
プログラム言語は[Ruby](https://www.ruby-lang.org/ja/)を使っています。  
`app.rb`は、[LINE Messaging API SDK for Ruby](https://github.com/line/line-bot-sdk-ruby)の[Synopsis](https://github.com/line/line-bot-sdk-ruby#synopsis)のまんまです。


# [LINE Developers](https://developers.line.biz/ja/)

[LINE Developers](https://developers.line.biz/ja/)に設定が必要です。  
以下をご参照ください。  

- [Messaging APIを始めよう](https://developers.line.biz/ja/docs/messaging-api/getting-started/)
- [ボットを作成する](https://developers.line.biz/ja/docs/messaging-api/building-bot/)
  - 文書中「[Herokuでサンプルボットを作成する](https://developers.line.biz/ja/docs/messaging-api/building-sample-bot-with-heroku/)」は飛ばしてください。このリポジトリのプログラム`app.rb`を使います。

TBD: 説明わかりにくいところは補足して欲しい。

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
