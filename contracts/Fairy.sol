// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Fairy is Ownable, ERC20{

    /// @dev Declare authorized token minter
    address public governor;

    /// @notice is the contract address(Pool address) that is allowed to mint and burn token.
    address public controller;


    uint256 private _totalSupply = 10_000_000e18; // 10 million FRY


    /// @notice An event that is emitted when the minter address changes
    event GovernorChanged(address governor, address newGovernor);


    /// @notice Construct a new FRY token

    constructor() ERC20('Fairy', 'FRY'){
        governor = msg.sender;
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

    function setController(address controller_) external {
        require(msg.sender == governor, "FRY::setGovernor: only the governor can set the controller contract address");
        controller = controller_;
    }

    /**
     * @notice Mint new tokens (FRY)
     * @param amount The number of tokens to be minted
     */
    function mint(address _user, uint amount) public onlyController {
        _mint(_user, amount);
    }


    /// @notice Allows the controller to burn tokens from a user account
    /// @param _user Address of the holder account to burn tokens from
    /// @param _amount Amount of tokens to burn
        
    function burn(address _user, uint256 _amount) public onlyController {
        _burn(_user, _amount);
    }


    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

     /// @dev Function modifier to ensure that the caller is the controller contract
    modifier onlyController {
        require(msg.sender == address(controller), "This is a controlled token. Only callable by UserPool contract");
        _;
    }
}
