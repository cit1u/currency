//SPDX-License-Identifier: Unlicense
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/ClonesUpgradeable.sol";

contract Purchasable {
    // a product that can be purchased
}

contract PurchasableRegistry {

    mapping(address => bool) public registered;

    Purchasable public template;

    // constructor
    function __PurchaseFactory_init(
        Purchasable _template
    ) public {
        template = _template;
    }

    function register() external {
        // TODO: checks if approved by authority
        address instance = ClonesUpgradeable.clone(
            address(template)
        );

        // set the address of our new implementation as verified by factory
        registered[instance] = true;
    }

    function isRegistered(address _destination) public view returns (bool) {
        return registered[_destination];
    }
}
