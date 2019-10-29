
cd ~ && sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt install -y build-essential libbz2-dev libdb-dev \
libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
libncursesw5-dev libsqlite3-dev libssl-dev \
zlib1g-dev uuid-dev tk-dev

wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

tar xzf Python-3.7.4.tgz && cd Python-3.7.4

./configure --enable-optimizations && make

sudo make altinstall

sudo pip3.7 install pipenv

