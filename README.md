# ali_dayu 简介

* 支持阿里大鱼的短信发送: `alibaba.aliqin.fc.sms.num.send`
* 支持阿里大鱼文本转语音: `alibaba.aliqin.fc.tts.num.singlecall`

# ali_dayu 安装

    $ gem install ali_dayu

# ali_dayu 使用
#### 生成配置文件
1.执行 `rails g ali_dayu` 生成配置文件 `config/initialiers/ali_dayu.rb`  

2.替换 `app_key`、`app_secret`、`post_url`

```
AliDayu.app_key = "YOUR_APP_KEY"
AliDayu.app_secret = "YOUR_APP_SECRET"
AliDayu.post_url = "YOUR_POST_URL"
```

#### 发送验证码
1.短信

```
AliDayu.sms_send('18600251122', {code: '123456', product: ''}, 'SMS_11585207', '进货宝')  
AliDayu.sms_send('18600251122', {code: '123456', product: ''}, 'SMS_11585207', '进货宝', '', {})  
```

* 第一个参数：短信接收号码，多个号码以英文逗号分隔
* 第二个参数：短信模板变量
* 第三个参数：短信模板ID
* 第四个参数：短信签名
* 第五个参数：公共回传参数，可为空
* 第六个参数：配置`app_key`、`app_secret`、`post_url`，可为空(默认使用配置文件中的设置)。此选项可满足一个项目中使用多个阿里大于应用（app_key）

2.语音

```
AliDayu.voice_send('18600251122', {product: '', code: '123456'}, 'TTS_22511215', '051482043260') 
AliDayu.voice_send('18600251122', {product: '', code: '123456'}, 'TTS_22511215', '051482043260', '', {})  
```

* 第一个参数：语音接收号码
* 第二个参数：文本转语音（TTS）模板变量
* 第三个参数：语音（TTS）模板ID
* 第四个参数：被叫号显
* 第五个参数：公共回传参数，可为空
* 第六个参数：配置`app_key`、`app_secret`、`post_url`，可为空(默认使用配置文件中的设置)。此选项可满足一个项目中使用多个阿里大于应用（app_key）

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WindStill/ali_dayu.

