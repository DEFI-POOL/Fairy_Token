// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fairy is ERC20{

    /// @dev Declare authorized token minter
    address minter;

    constructor() ERC20('Fairy', 'FRY'){
        minter = msg.sender;
    }
}
