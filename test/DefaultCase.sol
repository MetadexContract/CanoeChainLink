// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/MetadexContract/CanoeChainLink/blob/main/contracts/interfaces/ICanoeChainLink.sol";

contract DefaultCase {

    ICanoeChainLink public canoeChainLink;

    /**
    * @param _canoeChainLink Existing address (default view is ETH/USD)
    */
    constructor(address _canoeChainLink){
        canoeChainLink = ICanoeChainLink(_canoeChainLink);
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
