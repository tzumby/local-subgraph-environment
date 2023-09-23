# Setting up a local Subgraph Environment

This repository was created for **EVM Expeditions #03**, where [Felix](https://github.com/FHieser) gave an intro to subgraph development. You can find the video here:

[**👉 Click here for the video 👈**](https://www.youtube.com/watch?v=vCn7umrSnSg)

Structurewise this is an example project that should show how to setup a local Subgraph Environment.
This repo is based on the setup manual from The Graph directly:
https://thegraph.academy/developers/local-development/

## Clone with submodules

`git clone --recursive git@github.com:tzumby/local-subgraph-environment.git`

## Prequisites

The following packeges and tools have to be installed for the setup to be working:

### npm

https://www.npmjs.com/package/npm

### Foundry

https://book.getfoundry.sh/getting-started/installation

### Docker
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

The following steps should be followed in the given order to set up the local Test Setup.

### Install dependencies

Navigate in Terminal to the basicSubgraph folder

```
npm install
```

Installs all necessary dependecies needed for subgraph development.

### Local Chain with Anvil

Set up a local Chain with Anvil. In Terminal:

```
anvil --host 0.0.0.0
```

I'm not entirely sure why we host at the 0.0.0.0 IP-Address, but it took me hours to get this to work, so I wont question the machine gods any further.

Maybe as a note: I dont know what happens in the underlying prcess, but it seems to forward the IP to some 127.?.0.1 address and the setup script of the graph-node (./graph-node/docker/setup.sh) then picks up the address to implement it in the correct docker-compose file

### Push contract to the chain

In a new Terminal navigate to contractExample folder:

```
cd contractExample
```

Build the project:

```
forge build
```

Use forge to push the contract via the given script to the local Chain.

```
forge script script/DataMapping.s.sol:DataMappingScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

### Local Graph Node

Set up local Graph node with graph-cli.

In new Terminal navigate to the docker folder:

```
cd graph-node/docker
```

Then run:

```
./setup.sh
```

This adapts the local docker-compose file of the graph-node to link to the local chain, that we host with anvil.

```
docker-compose up
```

Starts the graph-node that should link up to the local chain automatically.

Note: For linux users you might have to use ```sudo``` for the script and docker commands.

### Deploying Subgraph

In new Terminal navigate to the subgraph folder:

```
cd basicSubgraph
```

Create the subgraph via:

```
graph codegen
```

Register subgraph name in the graph-node:

```
graph create basicSubgraph --node http://127.0.0.1:8020
```

Deploy the subgraph to the local graph-node:

```
graph deploy basicSubgraph --ipfs http://127.0.0.1:5001 --node http://127.0.0.1:8020
```



## Testing the GraphQL Interface of the Graph-Node

With [this Website](https://lucasconstantino.github.io/graphiql-online/) we can directly send GraphQl Requests to the Graph Node and test it.

For this change the endpoint of the website to the given endpoint by the appropriate graph node ip-address (its shown in the terminal when a subgraph is deployed).  

The answer to the following request should represent the state of the exampleContract that we deployed via the exampleContractDeploymentScript in @todo reference ### Push contract to the chain.

```
query{datas(subgraphError: allow){id,data}}
```
