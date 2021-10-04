// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol"; 

contract Fairy is ERC20{

    /// @dev Declare authorized token minter
    address public governor;

    /// @notice is the contract address(Pool address) that is allowed to mint and burn token.
    address public controller;

    /// @notice The timestamp after which minting may occur
    uint public mintingAllowedAfter;

    /// @notice Minimum time between mints
    uint32 public constant minimumTimeBetweenMints = 365 days; //1 year

    uint256 private _totalSupply = 10_000_000e18; // 10 million FRY


    /// @notice An event that is emitted when the minter address changes
    event GovernorChanged(address governor, address newGovernor);

    /// @notice Cap on the percentage of totalSupply that can be minted at each mint
    uint8 public constant mintCap = 2;

    /**
     * @notice Construct a new FRY token
     * @param mintingAllowedAfter_ The timestamp after which minting may occur
     */

    constructor(address controller_, uint mintingAllowedAfter_) ERC20('Fairy', 'FRY'){
        governor = msg.sender;

        mintingAllowedAfter = mintingAllowedAfter_;
        controller = controller_;
    }

    /**
     * @notice Change the governor address
     * @param governor_ The address of the new minter
     */
    function setGovernor(address governor_) external {
        require(msg.sender == governor, "FRY::setGovernor: only the governor can change the governor address");
        emit GovernorChanged(governor, governor_);
        governor = governor_;
    }

    /**
     * @notice Mint new tokens (FRY)
     * @param amount The number of tokens to be minted
     */
    function mint(uint amount) public onlyController {
        require(block.timestamp >= mintingAllowedAfter, "FRY::mint: minting not allowed yet");

        // record the mint
        mintingAllowedAfter = SafeMath.add(block.timestamp, minimumTimeBetweenMints);
        require(amount <= SafeMath.div(SafeMath.mul(_totalSupply, mintCap), 100), "FRY::mint: exceeded mint cap");
        _mint(msg.sender, amount);
    }


    /// @notice Allows the controller to burn tokens from a user account
    /// @param _user Address of the holder account to burn tokens from
    /// @param _amount Amount of tokens to burn
        
    function Burn(address _user, uint256 _amount) external virtual onlyController {
        _burn(_user, _amount);
    }


    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

     /// @dev Function modifier to ensure that the caller is the controller contract
    modifier onlyController {
        require(msg.sender == address(controller), "ControlledToken/only-controller");
        _;
    }
}
