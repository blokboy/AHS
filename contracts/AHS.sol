pragma solidity ^0.4.19;

/*
@title Address Handle Service aka AHS
@author Ghilia Weldesselasie, founder of D-OZ and genius extraordinaire
@twitter: @ghiliweld, my DMs are open so slide through if you trynna chat ;)

This is a simple alternative to ENS I made.
*/

contract AHS is HandleLogic {

    function AHS(uint256 _price, bytes32 _ethBase, bytes32 _weldBase) public {
        price = _price;
        getBaseQuick(_ethBase);
        getBaseQuick(_weldBase);
    }

    function () public payable {} // donations are optional

    function getBaseQuick(bytes32 _base) public onlyOwner {
        require(baseOwner[_base] != address(0)); // the base must exist
        baseOwner[_base] = msg.sender; // the ownership gets passed on to me
        NewBase(_base, msg.sender);
    }

    function withdraw() public onlyOwner{
        owner.transfer(this.balance);
    }

    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }

}
