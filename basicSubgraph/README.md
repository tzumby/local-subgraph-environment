## Subgraph

In the following steps we create a subgraph from scratch and then deploy it to the local graph-mode.

Note: [Here](https://github.com/graphprotocol/graph-node/blob/master/docs/getting-started.md) is an detailed explanation of creating a subgraph.

### Target Contract ABI

Copy the abi of the contract you want to test in json format into the abi folder.

Note: This could technically be avoided, by referencing the abi from the original contract folder directly in the subgraph.yaml.

### GraphQL Entity

A GraphQl Entity represents a Data Object, that you can query from a GraphQL Endpoint.

Create a schema.graphql file in the subgraph directory.

[Here](https://thegraph.com/docs/en/developing/creating-a-subgraph/#the-graph-ql-schema) is a Explanation of how to design and a graphQL entity.

### Create Mapping File

Create an empty file mapping.ts in the src folder.

It is later used to contain the Event Handlers that map the events to the data structure of the subgraph.

### subgraph.yaml / the subgraph manifest

The subgraph.yaml file is used in conjunction with the graphCLI to create auto-generated Typescript Event Mappings of the given abi and deploy the subgraph to the graph-node.

Create a subgraph.yaml file in the subgraph directory. The yaml file should contain the following:

```
description: <Subgraph Description>
specVersion: 0.0.4 #Not clear yet what implication this
schema:
    file: <graphql file> #+path to it
dataSources:
  - name: <name of the data Source>
    kind: ethereum/contract
    network: mainnet
    source:
      address: '<contract Address>'
      abi: <Abi used for this contract> #-->See mappings -> abis -> name
    mapping:
      kind: ethereum/events
      apiVersion: 0.0.5 #Not clear yet what implication this has
      language: wasm/assemblyscript
      file: <mapping file> #+path
      entities:
        - <GraphQl Entities used in mapping> #Declared in graphql file
      abis:
        - name: <naming of Abi> #used in source: abi above
          file: <abi file> #+path
      eventHandlers:
        - event: <event signature in solidity> #has to be repeated for every event that is listend to
          handler: <handler function name> #according handler function name that we later add in the mapping.ts file
```
Note: [Here](https://github.com/graphprotocol/graph-node/blob/master/docs/subgraph-manifest.md) is a description for each of the fields in the yaml file.

Use:

```
graph codegen
```

With this the Typescript Event Mappings are created.

### Fill the mapping file

[Here](https://thegraph.com/docs/en/developing/creating-a-subgraph/#writing-mappings) is a description of how to Write the correct EventHandler Mappings.

Note: Remember that the EventHandler Functions have to be the same as in the declaration of the subgraph.yaml.

### Deploying Subgraph

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