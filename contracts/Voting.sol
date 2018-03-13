pragma solidity ^0.4.2;

contract Voting {
	//  Whenever an event is called, the value passed into
	// the event will be logged in the transaction’s log
	event AddedCandidate(uint candidateID);

	// Structs allow you to hold multiple variables
	// and are good for things with multiple attributes
	struct Voter{
		bytes32 uid;
		unit candidateIDVote;
	}

	// state variables that hold values permanently 
	// stored on the blockchain
	unit numCandidates;
	unit numVoters;

	// mappings are like hash-maps or dictionaries
	// where it has a key-value pair
	mapping (unit => Candidate) candidates;
	mapping (unit => Voter) voters;

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *  These functions perform transactions, editing the mappings */

	function addCandidate(bytes32 name, bytes32 party) public {
		unit candidateID = numCandidates++;
		candidates[candidateID] = Candidate(name, party, true);
		AddedCandidate(candidateID);
	}

	function vote(bytes32 uid, unit candidateID) public {
		if(candidates[candidateID].doesExist == true){
			unit voterID = numVoters++;
			voters[voterID] = Voter(uid, candidateID);
		}
	}

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *  Getter functions marked by the word 'view'  */

	function totalVotes(uint candidateID) view public returns (uint) {
		uint numOfVotes = 0;
		for (uint i = 0; i < numVoters; i++) {
			if (voters[i].candidateIDVote == candidateID) {
				numOfVotes++;
			}
		}
		return numOfVotes; 
	}

	function getNumOfCandidates() public view returns(unit){
	return numCandidates;
	}

	function getNumOfVotes() public view returns(unit){
	return numVoters;
	}

	function getCandidate(unit candidateID) public view returns(uint, bytes32, bytes32){
	return (candidateID, candidates[candidateID].name, candidates[candidateID].party);
	}
}
