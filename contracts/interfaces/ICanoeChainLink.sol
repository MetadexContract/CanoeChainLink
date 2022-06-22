// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICanoeChainLink {

    /**
     * @dev Returns the latest price
     * @notice CanoeChainLink getLatestPrice function
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return price_ latest price
     */
    function getLatestPrice(address _priceFeed, uint80 _roundId) external view returns (int price_);

    /**
     * @dev Returns the latest round id
     * @notice CanoeChainLink getLatestRoundId function
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return roundId_ Round id
     */
    function getLatestRoundId(address _priceFeed, uint80 _roundId) external view returns (uint80 roundId_);

    /**
     * @dev Returns the latest round id
     * @notice CanoeChainLink getTimestamp function
     * @param _priceFeed Aggregator address
     * @param _roundId Round id(When the id is 0, query the latest)
     * @return startedAt_ timestamp of when the round started
     * @return updatedAt_ timestamp of when the round was updated
     */
    function getTimestamp(address _priceFeed, uint80 _roundId) external view returns (uint256 startedAt_, uint256 updatedAt_);

    /**
    * @dev Get the latest data
    * @notice getLatestData getLatestRoundId function
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
    );

    /**
    * @dev Get the latest data
    * @notice getLatestData getRoundIdData function
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
    );

    /**
    * @dev Returns price feed data
    * @notice getLatestData getPriceFeedData function
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
    );
}
