// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/MetadexContract/CanoeChainLink/blob/main/contracts/CanoeChainLink.sol";

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
