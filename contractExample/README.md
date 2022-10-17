# Deploy Contract to local net

### Start Anvil

```
anvil
```

### Deploy to anvil:

```
forge script script/DataMapping.s.sol:DataMappingScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

### Check if Deployment Script worked

```
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "number()(uint)"
```