# How to deploy a Contract to the local net

### Start Anvil

In terminal:

```
anvil
```

Note: You can check in the anvil terminal if the deployment process worked. Every interaction with the chain is logged in the console.

### Deploy to anvil

```
forge script script/DataMapping.s.sol:DataMappingScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

Note: [Here](https://book.getfoundry.sh/forge/deploying) is the guide of how to deploy scripts via forge.
