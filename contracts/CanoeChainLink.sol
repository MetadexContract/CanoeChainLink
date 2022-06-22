// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interfaces/ICanoeAggregatorInterface.sol";

contract CanoeChainLink {
    address public immutable priceFeed;

    constructor(address _priceFeed) {
        priceFeed = _priceFeed;
    }

    /**
     * @dev Returns the latest price
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return price_ latest price
     */
    function getLatestPrice(address _priceFeed, uint80 _roundId) external view returns (int price_) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        if (_roundId == 0) {
            (, price_,,,) = priceFeed_.latestRoundData();
        } else {
            (, price_,,,) = priceFeed_.getRoundData(_roundId);
        }
    }

    /**
     * @dev Returns the latest round id
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return roundId_ Round id
     */
    function getLatestRoundId(address _priceFeed, uint80 _roundId) external view returns (uint80 roundId_) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        if (_roundId == 0) {
            (roundId_,,,,) = priceFeed_.latestRoundData();
        } else {
            (roundId_,,,,) = priceFeed_.getRoundData(_roundId);
        }
    }

    /**
     * @dev Returns the latest round id
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return startedAt_ timestamp of when the round started 
     * @return updatedAt_ timestamp of when the round was updated
     */
    function getTimestamp(address _priceFeed, uint80 _roundId) external view returns (uint256 startedAt_, uint256 updatedAt_) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        if (_roundId == 0) {
            (,, startedAt_, updatedAt_,) = priceFeed_.latestRoundData();
        } else {
            (,, startedAt_, updatedAt_,) = priceFeed_.getRoundData(_roundId);
        }
    }

    /**
    * @dev Get the latest data
    * @param _priceFeed Aggregator address
    * @return price_ latest price
    * @return roundId_ latest roundId
    * @return startedAt_ latest started timestamp
    * @return updatedAt_ latest updated timestamp
    */
    function getLatestData(address _priceFeed)
    external view returns (
        int256 price_,
        uint80 roundId_,
        uint256 startedAt_,
        uint256 updatedAt_
    ) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        (
        roundId_,
        price_,
        startedAt_,
        updatedAt_,
        ) = priceFeed_.latestRoundData();
    }

    /**
    * @dev Get the latest data
    * @param _priceFeed Aggregator address
    * @param _roundId Round id(When the id is 0, query the latest)
    * @return price_ latest price_
    * @return roundId_ latest roundId_
    * @return startedAt_ latest started timestamp
    * @return updatedAt_ latest updated timestamp
    */
    function getRoundIdData(address _priceFeed, uint80 _roundId)
    external view returns (
        int price_,
        uint80 roundId_,
        uint256 startedAt_,
        uint256 updatedAt_
    ) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        (
        roundId_,
        price_,
        startedAt_,
        updatedAt_,
        ) = priceFeed_.getRoundData(_roundId);
    }

    /**
    * @dev Returns price feed data
    * @param _priceFeed Aggregator address
    * @return decimals_ price feed decimals,
    * @return description_ price feed description,
    * @return version_ price feed version
    */
    function getPriceFeedData(address _priceFeed)
    external view returns (
        uint8 decimals_,
        string memory description_,
        uint256 version_
    ) {
        ICanoeAggregatorInterface priceFeed_ = checkingData(_priceFeed);

        decimals_ = priceFeed_.decimals();
        description_ = priceFeed_.description();
        version_ = priceFeed_.version();
    }

    function checkingData(address _priceFeed) private view returns (ICanoeAggregatorInterface priceFeed_){
        priceFeed_ = _priceFeed == address(0) ?
        ICanoeAggregatorInterface(priceFeed) :
        ICanoeAggregatorInterface(_priceFeed);
    }
}
