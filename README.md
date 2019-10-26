# jupyterhub によるpython初心者講習環境の構築 

注意：　セキュリティは全く考慮されていません

**環境:**<br>
GCP ubuntu-1604-xenial-v20190913

<br>

### VMインスタンスの作成/接続

**インスタンス作成/接続：**<br>
1. HTTP, HTTPSトラフィックを許可するにチェックしてインスタンス作成
2. Google Cloud SDK をインストール
3. `gcloud init`
4. `gcloud compute ssh $instance_name` <br>
    ※デフォルトregion設定をインスタンスと同じにすること

<br>

### python環境の構築 

`cd ~ && sudo apt-get update && sudo apt-get upgrade`

`sudo apt install build-essential libbz2-dev libdb-dev \
 libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
 libncursesw5-dev libsqlite3-dev libssl-dev \
 zlib1g-dev uuid-dev tk-dev`

`wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz`

`tar xzf Python-3.7.4.tgz && cd Python-3.7.4`

`./configure --enable-optimizations && make`

`sudo make altinstall`

> make installはシステムのpython3を書き換える？

`wget https://bootstrap.pypa.io/get-pip.py | sudo python3.7`

`pip install pipenv`

`mkdir ~/jupyterhub && cd ~/jupyterhub`

