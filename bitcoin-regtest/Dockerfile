FROM ubuntu:precise

RUN apt-get -y update
RUN apt-get install -y python-software-properties 

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y bitcoind

RUN mkdir ~/.bitcoin
RUN echo "rpcuser=test\nrpcpassword=test\n" > ~/.bitcoin/bitcoin.conf

RUN echo "alias rt='bitcoin-cli -regtest'" >> ~/.bashrc
RUN echo "alias bitcoinrpc='bitcoind -regtest -rpcallowip=::/0 -printtoconsole -server -rpcuser=test -rpcpassword=test'" >> ~/.bashrc
