
cd ~ && sudo apt-get update && sudo apt-get upgrade

sudo apt install build-essential libbz2-dev libdb-dev \
libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
libncursesw5-dev libsqlite3-dev libssl-dev \
zlib1g-dev uuid-dev tk-dev

wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

tar xzf Python-3.7.4.tgz && cd Python-3.7.4

./configure --enable-optimizations && make

#make installはシステムのpython3を書き換える？
sudo make altinstall

wget https://bootstrap.pypa.io/get-pip.py | sudo python3.7

pip install pipenv

mkdir ~/jupyterhub && cd ~/jupyterhub
