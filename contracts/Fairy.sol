// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol"; 

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

    /// @notice Cap on the percentage of totalSupply that can be minted at each mint
    uint8 public constant mintCap = 2;

    /**
     * @notice Construct a new FRY token
     * @param mintingAllowedAfter_ The timestamp after which minting may occur
     */

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

    /**
     * @notice Mint new tokens (FRY)
     * @param amount The number of tokens to be minted
     */
    function mintFRY(uint amount) public {
        require(msg.sender == minter, "FRY::mint: only the minter can mint");
        require(block.timestamp >= mintingAllowedAfter, "FRY::mint: minting not allowed yet");

        // record the mint
        mintingAllowedAfter = SafeMath.add(block.timestamp, minimumTimeBetweenMints);
        require(amount <= SafeMath.div(SafeMath.mul(_totalSupply, mintCap), 100), "FRY::mint: exceeded mint cap");
        _mint(msg.sender, amount);
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }
}
