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


    /// @notice An event that is emitted when the minter address changes
    event MinterChanged(address minter, address newMinter);

    constructor(uint mintingAllowedAfter_) ERC20('Fairy', 'FRY'){
        minter = msg.sender;

        mintingAllowedAfter = mintingAllowedAfter_;
    }

    /**
     * @notice Change the minter address
     * @param minter_ The address of the new minter
     */
    function setMinter(address minter_) external {
        require(msg.sender == minter, "FRY::setMinter: only the minter can change the minter address");
        emit MinterChanged(minter, minter_);
        minter = minter_;
    }

    function mintFRY() external {
        require(msg.sender == minter, "FRY::mint: only the minter can mint");
    }
}
