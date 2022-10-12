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

## Setting up

## Building Subgraph

### Base Necessities

#### subgraph.yaml / the subgraph manifest

```
description: <Subgraph Description>
schema:
    file: <graphql file> #+path to it
dataSources:
  - name: <name of the data Source>
    kind: ethereum/contract
    network: mainnet
    source:
      abi: <Abi used for this contract> #-->See mappings -> abis -> name
    mapping:
      kind: ethereum/events
      apiVersion: 0.0.1 #Not clear yet what implication this has
      language: wasm/assemblyscript
      file: <mapping file> #+path
      entities:
        - <GraphQl Entities used in mapping> #Declared in graphql file
      abis:
        - name: <naming of Abi> #used in source: abi above
          file: <abi file> #+path
      eventHandlers:
        - event: <event signature in solidity> #has to be repeated for every event that is listend to
          handler: <handler function name> #according handler function name in mapping file above
```

https://github.com/graphprotocol/graph-node/blob/master/docs/getting-started.md

https://github.com/graphprotocol/graph-node/blob/master/docs/subgraph-manifest.md

https://vitalpoint.ai/course/subgraph-manifest/

### Finalizing

graph codegen

## Testing

https://lucasconstantino.github.io/graphiql-online/

<style>
body { counter-reset: h1counter h2counter h3counter h4counter h5counter h6counter; }

h1 { counter-reset: h2counter; }
h2 { counter-reset: h3counter; }
h3 { counter-reset: h4counter; }
h4 { counter-reset: h5counter; }
h5 { counter-reset: h6counter; }
h6 {}

h2:before {
    counter-increment: h2counter;
    content: counter(h2counter) ".\0000a0\0000a0";
}

h3:before {
    counter-increment: h3counter;
    content: counter(h2counter) "." counter(h3counter) ".\0000a0\0000a0";
}

h4:before {
    counter-increment: h4counter;
    content: counter(h2counter) "." counter(h3counter) "." counter(h4counter) ".\0000a0\0000a0";
}

h5:before {
    counter-increment: h5counter;
    content: counter(h2counter) "." counter(h3counter) "." counter(h4counter) "." counter(h5counter) ".\0000a0\0000a0";
}

h6:before {
    counter-increment: h6counter;
    content: counter(h2counter) "." counter(h3counter) "." counter(h4counter) "." counter(h5counter) "." counter(h6counter) ".\0000a0\0000a0";
}
</style>