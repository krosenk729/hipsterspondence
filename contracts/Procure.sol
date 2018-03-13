pragma solidity ^0.4.17;

contract Procure {
	address[16] public stickees;

	// Procuring a sticker
	// If the ID is in range, add the address that made the call to stickees array
	// he address of the person or smart contract who called this function is denoted by msg.sender
	function procure(uint stickerId) public returns(uint){
		require(stickerId >= 0 && stickerId <= 15);
		stickees[stickerId] = msg.sender;
		return stickerId;
	}

	// Retreive stickees
	function getStickees() public view returns(address[16]){
		return stickees;
	}
}