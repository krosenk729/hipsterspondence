pragma solidity ^0.4.17;

contract Procure {
	address[16] public stickees;

	// Procuring a sticker
	function procure(uint stickerId) public returns(int){
		retuire(stickerId >= 0 && stickerId <= 15);
		stickees[stickerId] = msg.sender;
		return stickerId;
	}

}