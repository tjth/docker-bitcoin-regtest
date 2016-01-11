DOCKER_RUN=sudo docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -p 18444:18444 -p 18332:18332 --name=alice --hostname=alice
DOCKER_BOB  =$(DOCKER_RUN) -p 19444:18444 -p 19332:18332 --name=bob --hostname=bob
DOCKER_MIKE =$(DOCKER_RUN) -p 20444:18444 -p 20332:18332 --name=mike --hostname=mike

IMG=gak/bitcoin-regtest

RUN_DAEMON=bitcoind -regtest -rpcallowip=::/0 -printtoconsole -server
RUN_SHELL=bash

build:
	sudo docker build -t gak/bitcoin-regtest bitcoin-regtest

alice_rm:
	-sudo docker rm -f alice

bob_rm:
	-sudo docker rm -f bob

mike_rm:
	-sudo docker rm -f mike

alice_daemon: build alice_rm
	$(DOCKER_ALICE) -d=true $(IMG) $(RUN_DAEMON)

alice_shell: build alice_rm
	$(DOCKER_ALICE) -i $(IMG) $(RUN_SHELL)

bob_daemon: build bob_rm
	$(DOCKER_BOB) -d=true $(IMG) $(RUN_DAEMON)

bob_shell: build bob_rm
	$(DOCKER_BOB) -i $(IMG) $(RUN_SHELL)

mike_daemon: build mike_rm
	$(DOCKER_MIKE) -d=true $(IMG) $(RUN_DAEMON)

mike_shell: build mike_rm
	$(DOCKER_MIKE) -i $(IMG) $(RUN_SHELL)
