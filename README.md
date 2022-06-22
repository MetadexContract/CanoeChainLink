## **Project information**

ChainLink is a decentralized oracle service currently employed by Canoe to provide external data for financial contracts. For the price information of financial contracts on the chain, the Chain Link oracle can be introduced to provide stable and accurate prices. Canoe has encapsulated its Proxy query interface in a friendly way, hoping to make it more convenient for you to use.
## Basic introduction to CanoeChainLink

`ChainLink`It is the industry's top smart contract decentralized oracle network solution, enabling smart contracts to securely access off-chain data sources, website APIs, and traditional bank payments.

## Building Canoe ChainLink
For convenience, we first introduce CanoeChainLink, and then use the Proxy officially provided by ChainLink to obtain prices and other operations.

## Using Canoe ChainLink

1. solidity version is greater than 0.8.0;

```plain
pragma solidity ^0.8.0;
```

2. [ChainLink](https://docs.chain.link/docs/ethereum-addresses/)官网获取到提供的Proxy；
   |Ethereum Mainnet| | | |:----|:----|:----| |Pair|Dec|Proxy| |1INCH /
   ETH|18|[0x72AFAECF99C9d9C8215fF44C77B94B99C28741e8](https://etherscan.io/address/0x72AFAECF99C9d9C8215fF44C77B94B99C28741e8)|
   |1INCH /
   USD|8|[0xc929ad75B72593967DE83E7F7Cda0493458261D9](https://etherscan.io/address/0xc929ad75B72593967DE83E7F7Cda0493458261D9)|
   |AAPL /
   USD|8|[0x139C8512Cde1778e9b9a8e721ce1aEbd4dD43587](https://etherscan.io/address/0x139C8512Cde1778e9b9a8e721ce1aEbd4dD43587)|
   |AAVE /
   ETH|18|[0x6Df09E975c830ECae5bd4eD9d90f3A95a4f88012](https://etherscan.io/address/0x6Df09E975c830ECae5bd4eD9d90f3A95a4f88012)|
   |AAVE /
   USD|8|[0x547a514d5e3769680Ce22B2361c10Ea13619e8a9](https://etherscan.io/address/0x547a514d5e3769680Ce22B2361c10Ea13619e8a9)|
   |ADA /
   USD|8|[0xAE48c91dF1fE419994FFDa27da09D5aC69c30f55](https://etherscan.io/address/0xAE48c91dF1fE419994FFDa27da09D5aC69c30f55)|
   |ADX /
   USD|8|[0x231e764B44b2C1b7Ca171fa8021A24ed520Cde10](https://etherscan.io/address/0x231e764B44b2C1b7Ca171fa8021A24ed520Cde10)|
   |...|...|...|

3. Customize your query with CanoeChainLink

```plain
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "";

contract CustomizedCase {
    CanoeChainLink public canoeChainLink;
    /**
    * @param _aggregatorAddress This contract requires the default query price address
    */
    constructor(address _aggregatorAddress){
        canoeChainLink = new CanoeChainLink(_aggregatorAddress);
    }
    function getDefaultLatestPrice() public view returns (int256 price_){
       /*
       * Query the aggregator address customized by the contract
       * Passing in an empty address is the default aggregator address
       * Passing in 0 for the latest price
       */
        price_ = canoeChainLink.getLatestPrice(address(0), 0);
    }
}
```

4. Use Canoe Chain Link to specify your query

Matic Mainnet address: "0xD72e24B934dc614F76BAE3CE43F8498148f82826"

Matic Testnet address: "0xD72e24B934dc614F76BAE3CE43F8498148f82826"

```plain
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "";

contract DefaultCase {
    ICanoeChainLink public canoeChainLink;
    /**
    * @param _canoeChainLink Existing address (default view is ETH/USD)
    */
    constructor(){
        canoeChainLink = ICanoeChainLink();
    }

    function getDefaultLatestPrice(address _aggregate) public view returns (int256 price_){
        /*
        * Query aggregate address
        * Passing in an empty address is the default aggregator address
        * Passing in 0 for the latest price
        */
        price_ = canoeChainLink.getLatestPrice(_aggregate, 0);
    }
}
```

