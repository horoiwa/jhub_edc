# jupyterhub によるpython初心者講習環境の構築 

やりたいこと

- LDAP認証によるユーザー管理
- dockerspwanerによるシングルjupyterサーバーの生成
- jupyterlabの使用
- デフォルトノートブックの配置

<br>

## VMインスタンスの作成/接続

**環境:**<br>
GCP ubuntu-1604-xenial-v20190913

**ネットワーク設定**<br>
80, 443, 8000番ポートを開けなければいけない<br>
VPCネットワーク > ファイアウォール　タブの
”ファイアウォールルールを作成” からポート開放の設定を行う

詳細は"GCE ポート開放"　とかでググろう<br>
※80番, 443番はインスタンス作成の設定でも開放できる


**インスタンス作成/接続：**<br>
1. HTTP, HTTPSトラフィックを許可するにチェックしてインスタンス作成
2. Google Cloud SDK をインストール
3. `gcloud init`
4. `gcloud compute ssh $instance_name` <br>
    ※デフォルトregion設定をインスタンスと同じにすること

<br>

## python環境の構築 

ソースコードからpythonをインストールします

`bash prep_python.sh`

<br>

## 依存パッケージのインストール

apt-getからdockerとnpmなどのインストールを行います

`bash prep_evn.sh`

<br>

#### npm関連

【注意】<br>
公式ドキュメントではapt-getでnpmとnodejs-legacyをインストールすればよいと書いてありますがubuntu16.04環境だとjupytehubの起動時に以下のようなエラーでこけます。
```
SyntaxError: Unexpected token {
    at exports.runInThisContext (vm.js:53:16)
    at Module._compile (module.js:374:25)
    at Object.Module._extensions..js (module.js:417:10)
    at Module.load (module.js:344:32)
    at Function.Module._load (module.js:301:12)
    at Module.require (module.js:354:17)
    at require (internal/module.js:12:17)
    at Object.<anonymous> (/usr/local/lib/node_modules/configurable-http-proxy/bin/configurable-http-proxy:14:13)
    at Module._compile (module.js:410:26)
    at Object.Module._extensions..js (module.js:417:10)
horo@hubtest2:~/jupyterhub$ which -a configurable-http-proxy
/usr/local/bin/configurable-http-proxy
horo@hubtest2:~/jupyterhub$ configurable-http-proxy --ip 0.0.0.0 --port 443
/usr/local/lib/node_modules/configurable-http-proxy/node_modules/winston/lib/winston.js:11
const { warn } = require('./winston/common');
```

以下のIsuueを参考にnodejsをインストールすることで解決しました<br>
https://github.com/jupyterhub/jupyterhub/issues/530

```
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install -y nodejs
```

#### dockerのインストール

正常にインストールできてるかテスト<br>
`sudo docker run hello-world`


<br>

## JupyterHubのインストール
pipenvで作成した環境内へインストールします


`mkdir ~/jupyterhub && cd ~/jupyterhub`

`bash prep_jupyterhub.sh`

## 中間起動テスト
認証やspawnerの設定はしていないがとりあえず起動テスト

`cd ~/jupyterhub && pipenv run jupyterhub --no-ssl`

ブラウザで http://YOUR_IP:8000/ へアクセス

<br>

## DockerSpawnerの設定


<br>

## バックグラウンドでサービス化

`nohup jupyterhub --no-ssl &`

<br>

## 参考 

dockerspwaner：<br>
https://github.com/jupyterhub/dockerspawner