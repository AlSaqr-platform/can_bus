Download repo

git clone git@github.com:alsaqr-platform/can_bus.git

Checkout correct branch

cd can_bus
git checkout can_vip

#use bash shell

bash

curl --proto '=https' --tlsv1.2 https://fabianschuiki.github.io/bender/init -sSf | sh -s -- 0.25.2

export PATH=$PWD:$PATH

make build

