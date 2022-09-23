# Setting up a local Subgraph Environment

Structurewise this is an example project that should show how to setup a local Subgraph Environment.
This repo is based on the setup manual from The Graph directly:
https://thegraph.academy/developers/local-development/

## Prequisites

The following packeges and tools have to be installed for the setup to be working:

### Ganache:
```
# NPM
npm install -g truffle ganache-cli

# Yarn
yarn global add truffle ganache-cli
```

### Docker:
https://docs.docker.com/get-started/#download-and-install-docker

For the usage of docker-compose you might have to install the cli tool seperately. For my Ubuntu-Linux System I used apt install:
```
apt install docker-compose 
```

### Graph CLI
```
# NPM
npm install -g @graphprotocol/graph-cli

# Yarn
yarn global add @graphprotocol/graph-cli
```

