# Fairy_Token
An ERC20 token for the Fairy Pool DEFI protocol to serve as tickets/collateral to redeem deposited funds by users. This token adopts the behaviour of Openzeppelin's ERC20 contract. 

Functions
------------------------------------------------------------------------------------
approve

See {IERC20-approve}. Requirements: - `spender` cannot be the zero address.
| Name    	| Type    	| Description |
| :---------|:---------:| -----------:|
| spender 	| address 	|             |
| amount 	| uint256 	|             |

Returns:
| Name    	| Type    	| Description |
| :---------|:---------:| -----------:|
|           | bool      |             |

-------------------------------------------------------------------------------------
decreaseAllowance

Atomically decreases the allowance granted to `spender` by the caller. This is an alternative to {approve} that can be used as a mitigation for problems described in {IERC20-approve}. Emits an {Approval} event indicating the updated allowance. Requirements: - `spender` cannot be the zero address. - `spender` must have allowance for the caller of at least `subtractedValue`.

| Name    	| Type    	| Description |
|:----------|:---------:| -----------:|
| spender 	| address 	|             |
| subtractedValue | uint256           | 	

Returns:
| Name    	| Type    	| Description |
|:----------|:----------| -----------:|
|	        | bool      |             |

---------------------------------------------------------------------------------------
increaseAllowance

Atomically increases the allowance granted to `spender` by the caller. This is an alternative to {approve} that can be used as a mitigation for problems described in {IERC20-approve}. Emits an {Approval} event indicating the updated allowance. Requirements: - `spender` cannot be the zero address.

| Name    	| Type    	| Description |
|:----------|:---------:| -----------:|
| spender 	| address 	|             |
| addedValue | uint256           | 	

Returns:
| Name    	| Type    	| Description |
|:----------|:----------| -----------:|
|	        | bool      |             |

-------------------------------------------------------------------------------------------
	
mintFRY

**Add Documentation for the method here**
	
| Name    	| Type    	| Description |
| :---------|:---------:| -----------:|
| amount 	| uint256 	|             |

Returns:
No parameters
--------------------------------------------------------------------------------------------

setMinter

**Add Documentation for the method here**	

Returns:
No parameters

| Name    	| Type    	| Description |
| :---------|:---------:| -----------:|
| amount 	| uint256 	|             |

Returns:

No parameters

------------------------------------------------------------------------------------------------
transfer

See {IERC20-transfer}. Requirements: - `recipient` cannot be the zero address. - the caller must have a balance of at least `amount`.
Name 	Type 	Description
recipient 	address 	
amount 	uint256 	

Returns:
Name 	Type 	Description
	bool 	
transferFrom

See {IERC20-transferFrom}. Emits an {Approval} event indicating the updated allowance. This is not required by the EIP. See the note at the beginning of {ERC20}. Requirements: - `sender` and `recipient` cannot be the zero address. - `sender` must have a balance of at least `amount`. - the caller must have allowance for ``sender``'s tokens of at least `amount`.
Name 	Type 	Description
sender 	address 	
recipient 	address 	
amount 	uint256 	

Returns:
Name 	Type 	Description
	bool 	
constructor
Name 	Type 	Description
mintingAllowedAfter_ 	uint256 	

Returns:

No parameters
allowance

See {IERC20-allowance}.
Name 	Type 	Description
owner 	address 	
spender 	address 	

Returns:
Name 	Type 	Description
	uint256 	
balanceOf

See {IERC20-balanceOf}.
Name 	Type 	Description
account 	address 	

Returns:
Name 	Type 	Description
	uint256 	
decimals

Returns the number of decimals used to get its user representation. For example, if `decimals` equals `2`, a balance of `505` tokens should be displayed to a user as `5.05` (`505 / 10 ** 2`). Tokens usually opt for a value of 18, imitating the relationship between Ether and Wei. This is the value {ERC20} uses, unless this function is overridden; NOTE: This information is only used for _display_ purposes: it in no way affects any of the arithmetic of the contract, including {IERC20-balanceOf} and {IERC20-transfer}.

No parameters

Returns:
Name 	Type 	Description
	uint8 	
minimumTimeBetweenMints

**Add Documentation for the method here**

No parameters

Returns:
Name 	Type 	Description
	uint32 	
mintCap

**Add Documentation for the method here**

No parameters

Returns:
Name 	Type 	Description
	uint8 	
mintingAllowedAfter

**Add Documentation for the method here**

No parameters

Returns:
Name 	Type 	Description
	uint256 	
name

Returns the name of the token.

No parameters

Returns:
Name 	Type 	Description
	string 	
symbol

Returns the symbol of the token, usually a shorter version of the name.

No parameters

Returns:
Name 	Type 	Description
	string 	
totalSupply

See {IERC20-totalSupply}.

No parameters

Returns:
Name 	Type 	Description
	uint256 	