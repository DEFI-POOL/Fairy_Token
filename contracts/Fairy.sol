// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fairy is ERC20{

    /// @dev Declare authorized token minter
    address minter;

    /// @notice The timestamp after which minting may occur
    uint public mintingAllowedAfter;

    /// @notice Minimum time between mints
    uint32 public constant minimumTimeBetweenMints = 365 days; //1 year

    uint256 private _totalSupply = 10_000_000e18; // 10 million FRY

    constructor(uint mintingAllowedAfter_) ERC20('Fairy', 'FRY'){
        minter = msg.sender;

        mintingAllowedAfter = mintingAllowedAfter_;
    }
}
