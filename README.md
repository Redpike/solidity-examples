# Solidity Smart Contract Examples

## 1. Project structure

TBA

## 2. Development Environment

Build Ganache docker container:

```shell
docker build -t solidity-examples-ganache:1.0.0 .
docker run --name solidity-examples-ganache -p 18545:8545 -d solidity-examples-ganache:1.0.0
```

Expected result:

```text
Available Accounts
==================
(0) 0xbD004d9048C9b9e5C4B5109c68dd569A65c47CF9 (100 ETH)
(1) 0x11BdE3126f46Cfb3851a9102c60b510B1305aF5b (100 ETH)
(2) 0x02EfFf6494Ed3aa231857a2ACeDb9A1B0211d7C7 (100 ETH)
(3) 0xDaF8C1eE78c25D8320836fcEDa1Cf600846e9217 (100 ETH)
(4) 0x7C7211e3b82820484D5F653808f0471B74BF1994 (100 ETH)
(5) 0x6F569F7c369545cB265267Af1D46C36DF19a9633 (100 ETH)
(6) 0xcbfC221c36C56Cc0B418eDC78682213a23C41EBE (100 ETH)
(7) 0xDdf5C39CC56bf01374AD5D596D2C636352D870c6 (100 ETH)
(8) 0x2Eb6acE815412edEE005164a1aEcbB24FE0571B6 (100 ETH)
(9) 0x94334a3261961b3EdD13D72cfd7E9651789E1217 (100 ETH)

Private Keys
==================
(0) 0x91fd4e8a060cceff00ae5cde99d5b167179f724d9a424e24672e4200c7679c98
(1) 0x6926ce01074106dcf4456a4e2cd744cf21fb062901494cc85141c9082659a7b1
(2) 0xfed50f28357330e9244756376db521b0a90e5b6160eb0eb643dc8c2784fba213
(3) 0x63da16f1241d130e98fc7245ece0e200d7d40f8d7a8f7344f728b8ae9ad9a95b
(4) 0xab2614ba1798f4603181f121d8c80da1ba0db7f3b31a7fe30b68db407f131222
(5) 0xcdc9f71e8a5e6b8ec0825a36ddb9c8d1406f9c78c06278939da836e2d21f337b
(6) 0x7d76116139c9d733deb97b3c583221ddd944fe798b5998536b1d0d812f181696
(7) 0x4fddacb56d254f433de2aee3ff011f586a76c3974dd83757c66c1a191bc7343f
(8) 0x61906ba815cf115edbcfb6855161633f98f6791250ae369f8dd23e8168d69c94
(9) 0xf0c3bcc5f51a1ac8e3114cd42aa84d3d559c1dd0cb15e60b3d1b95d1f1e24c31
```

Compile smart contracts:

```shell
npx hardhat compile
```

Deploy smart contract on Your local blockchain:

```shell
npx hardhat run scripts/deploy.ts --network ganache
```
