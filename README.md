# smart-contract
This repository contains the smart contract Solidity code which.
### CODE


- [TFG_Storage.sol:](https://github.com/injustweet-tfg/smart-contract/TFG_Storage.sol)         This file has the Solidity code of the smart contract we are using to save the tweet's information. It has similar methods to the API. 

  Here can be found an array that for each position is stored the information of an IPFS file, this mean, the hash and the tweet IDs that can be found in it. Also, there is a map which has for each ID, the position from the files array were is the IPFS hash of the file in IPFS which contains the updated tweet info.

  The funtions are:
  - setFile: receives an IPFS file hash and an array with the tweet IDs in it. It stores the data in the map and the array.
  - getFiles: returns the main array with all the IPFS hashes and the tweet IDs associated to them.
  - getHashFromTweetID: this funtion is no longer called by the API with the current form of sending information, but it can be used for debbuging purposes, search for information on a specific tweet or another way of using this public data.
  - updateTweets: receives an IPFS file hash and an array with the updated tweet IDs in it. It removes the ID from the older IPFS hash associated list of IDs, replace the old position from the IPFS file hash which is stored in with the new hash and stores the new file and tweet IDs in the main array.
