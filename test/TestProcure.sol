pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Procure.sol";

contract TestProcure {
  Procure procure = Procure(DeployedAddresses.Procure());

}