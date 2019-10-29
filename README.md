# jupyterhub によるpython初心者講習環境の構築 

やりたいこと

- LDAP認証によるユーザー管理
- dockerspwanerによるシングルjupyterサーバーの生成
- jupyterlabの使用
- デフォルトノートブックの配置

<br>

### VMインスタンスの作成/接続

**環境:**<br>
GCP ubuntu-1604-xenial-v20190913

**インスタンス作成/接続：**<br>
1. HTTP, HTTPSトラフィックを許可するにチェックしてインスタンス作成
2. Google Cloud SDK をインストール
3. `gcloud init`
4. `gcloud compute ssh $instance_name` <br>
    ※デフォルトregion設定をインスタンスと同じにすること

<br>

### python環境の構築 

ソースコードからpythonをインストールします

`bash prep_python.sh`

<br>

### JupyterHubのインストール

参考：<br>
https://github.com/jupyterhub/dockerspawner

`mkdir ~/jupyterhub && cd ~/jupyterhub`

`bash install_jupyterhub.sh`

### aaa 