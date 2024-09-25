# SimpleVotingDApp
I've created a simple Voting DApp that allows users to link an unique votingId to a specific vote.

Something interesting that I have found with this project is that when storing the votes. I was able to create two ways of storing the data. 

They both use mappings, however one mapping uses a key/value pair of uint256 => structure and the other one uses a key/value pair of uint256 => array[].


