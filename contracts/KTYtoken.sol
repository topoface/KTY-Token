pragma solidity ^0.5.0;

import './openzeppelin_v2_4_0/token/ERC20/ERC20.sol';
import './openzeppelin_v2_4_0/token/ERC20/ERC20Detailed.sol';
import './openzeppelin_v2_4_0/ownership/Ownable.sol';

contract KTYtoken is Ownable, ERC20, ERC20Detailed {
    string constant NAME    = 'Kittiefight';
    string constant SYMBOL  = 'KTY';
    string constant DECIMALS  = 18;
    uint256 constant MAX_TOTAL_SUPPLY = 100_000_000 * 10**DECIMALS;

    constructor() ERC20Detailed(NAME, SYMBOL, DECIMALS) public {
    }

    /**
     * @notice Mint new KTY
     * It also verifies that MAX_TOTAL_SUPPLY will not be exeeded by this call
     * @param account Address to send minted tokens
     * @param amount Amount of tokens to mint
     * @return Should always return true
     */
    function mint(address account, uint256 amount) public onlyOwner returns (bool) {
        require(totalSupply().add(amount) <= MAX_TOTAL_SUPPLY, "KTYtoken: cap exceeded");
        _mint(_msgSender(), account, amount, '', '');
        return true;
    }
}

