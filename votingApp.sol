pragma solidity ^0.8.26;

contract votingApp {

    struct makeVote{
        uint256 votingId;
        string writtenVote;
    }

    // Modifier to check if the votingId is unique
    modifier uniqueVotingId(uint256 id) {
        require(bytes(listOrganizer[id].writtenVote).length == 0, "This votingId has already been used");
         _;
     }

    // Map votingId to a single makeVote struct, not an array
    mapping(uint256 => makeVote) public listOrganizer;

    function createVote(uint256 id, string memory vote) uniqueVotingId(id) external {
        // Create a new vote
        makeVote memory newVote;
        newVote.votingId = id;
        newVote.writtenVote = vote;

         // Assign the vote directly to the mapping
         listOrganizer[id] = newVote;
     }

    function getVote(uint256 id) external view returns (makeVote memory) {
    // Return the vote directly using the id as the key
        return listOrganizer[id];
    }

}
