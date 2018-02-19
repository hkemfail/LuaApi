sudo apt-get update
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson* libpython-dev make unzip git redis-server g++ -y --force-yes
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
tar zxpf luarocks-2.2.2.tar.gz
cd luarocks-2.2.2
./configure; sudo make bootstrap
sudo luarocks install luasocket
sudo luarocks install luasec
sudo luarocks install redis-lua
sudo luarocks install ansicolors
sudo luarocks install serpent
cd ..
sudo apt-get install curl -y
rm -fr luarocks-2.2.2.tar.gz
rm -fr install.sh
