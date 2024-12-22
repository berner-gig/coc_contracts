# Clash of Clef

## Contracts

### Token
> Deployed at
> - Bsc testnet: 0x0c0621f8233d50274A021E50bf3c3F22Cc81f3bB

### Role
> Deployed at
> - Bsc testnet: 0xb603fc190FF9A274f423745196c47374Cb4e92ae

### Campaign
> Deployed at
> - Bsc testnet: 0xCbD8Cae36B32f34F3B7aA3d4C0092d1Ffc5d9BdE

### ClashOfClef
> Deployed at
> - Bsc testnet: 0x3de07B9bdFe413859d015726D326740786B0A5b9

## Development

### Environment Setup
.env file
```
PRIVATE_KEY=${YOUR_PRIVATE_KEY}
COC_TOKEN_ADDRESS=${YOUR_COC_TOKEN_ADDRESS}
COC_ROLE_ADDRESS=${YOUR_COC_ROLE_ADDRESS}
COC_CAMPAIGN_ADDRESS=${YOUR_COC_CAMPAIGN_ADDRESS}
COC_ADDRESS=${YOUR_COC_ADDRESS}
```

### Deployment
- Deploy Token to Bsc testnet
```bash
npx hardhat deploy_token --network bsc_testnet
```

- Deploy Role to Bsc testnet
```bash
npx hardhat deploy_role --network bsc_testnet
```

- Deploy Campaign to Bsc testnet

```bash
npx hardhat deploy_campaign --network bsc_testnet
```

- Deploy CoC to Bsc testnet

Warning: Make sure to set the `COC_TOKEN_ADDRESS`, `COC_ROLE_ADDRESS`, and `COC_CAMPAIGN_ADDRESS` in the .env file
```bash
npx hardhat deploy_coc --network bsc_testnet
```