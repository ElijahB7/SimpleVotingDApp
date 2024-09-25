pragma solidity ^0.8.26

contract votingApp2 {

    struct makeVote {
        uint256 votingId;
        string usernameId;
    }

    mapping(uint256 => makeVote[]) storedUsers;

    // Modifier to ensure the votingId is unique and has not been used before
    modifier uniqueVotingId(uint256 id) {
        require(storedUsers[id].length == 0, "votingId already used");
        _;
    }

    function createVote(uint256 id, string memory user) external uniqueVotingId(id) {
        makeVote memory newVote;
        newVote.votingId = id;
        newVote.usernameId = user;
        // push new users to the array list where it will be stored
        storedUsers[id].push(newVote);
    }

    function getVote(uint256 id) external view returns(makeVote[] memory) {
        return(storedUsers[id]);
    }
}
