pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Procure.sol";

contract TestProcure {
  Procure procurement = Procure(DeployedAddresses.Procure());
  // test procure() function
  function testUserCanProcureSticker() public {
  	uint returnedId = procurement.procure(8);
  	uint expected = 8;
  	Assert.equal(returnedId, expected, "Procurement of sticker ID 8 should be recorded.");
  }

  // test getStickees() function
  function testGetStickeesByStickerId() public {
  	address expected = this;
	address stickee = procurement.stickees(8);
  	Assert.equal(stickee, expected, "Owner of sticker ID 8 should be recorded.");
  }
  function testGetStickeesByStickerIdInArray() public {
  	address expected = this;
  	address[16] memory stickees = procurement.getStickees();
  	Assert.equal(stickees[8], expected, "Owner of sticker ID 8 should be recorded.");
  }

}