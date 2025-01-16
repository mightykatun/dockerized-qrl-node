# Docker-QRL-Node
All you need to run your own qrl node, dockerized. Resolves the build problems the modules have by setting proper versions.

Here is a sample docker compose file:
```sample.yaml
services:
  node:
    container_name: qrl-node
    image: qrl-node:latest
    restart: unless-stopped
    environment:
      - START_CMD: "qrl_start" # set the command that runs on startup, see the docs: https://docs.theqrl.org/use/node/installation
    volumes:
      - ./qrl-data:/root/.qrl
    ports:
      - 19000:19000 # to participate in the P2P network, needs port forwarding outside your network
```
