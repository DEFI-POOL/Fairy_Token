// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fairy is ERC20{

    /// @dev Declare authorized token minter
    address minter;

    /// @notice The timestamp after which minting may occur
    uint public mintingAllowedAfter;

    constructor(uint mintingAllowedAfter_) ERC20('Fairy', 'FRY'){
        minter = msg.sender;

        mintingAllowedAfter = mintingAllowedAfter_;
    }
}
