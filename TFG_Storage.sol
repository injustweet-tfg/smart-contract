// SPDX-License-Identifier: GPL3
pragma solidity ^0.8.7;

contract TFGStorage {
    struct TweetsFile {//represent a file with tweets stored on IPFS
        string IPFShash;//the hash of the file
        string[] tweetID;// array with the ID's of the tweets stored on this IFPS file
    }
    TweetsFile[] tweetsFiles;// array with all of our files stored on IPFS
   
    mapping(string => uint) storedTweets; //a map with all the tweetsID and the file in which they are

    function setFile(string memory hash, string[] memory tweetsID) external {
        TweetsFile memory tf = TweetsFile(hash, tweetsID);
        tweetsFiles.push(tf);
        for(uint i =0; i < tweetsID.length; i++){
            storedTweets[tweetsID[i]] = tweetsFiles.length - 1;
        }
    }

    function getFiles() external view returns (TweetsFile[] memory){
        return tweetsFiles;
    }

    function getHashFromTweetID(string memory tweetID) external view returns (string memory){
        return tweetsFiles[storedTweets[tweetID]].IPFShash;
    }

    function updateTweets(string memory hash, string[] memory tweetsID) external {
        for(uint j = 0; j < tweetsID.length; j++){
            uint pos = storedTweets[tweetsID[j]];

            for(uint i = 0; i < tweetsFiles[pos].tweetID.length; i++){
                if(keccak256(abi.encodePacked(tweetsFiles[pos].tweetID[i])) == keccak256(abi.encodePacked(tweetsID[j]))){
                    tweetsFiles[pos].tweetID[i] = tweetsFiles[pos].tweetID[tweetsFiles[pos].tweetID.length-1];
                    tweetsFiles[pos].tweetID.pop();
                }
            }
            if(tweetsFiles[pos].tweetID.length == 0){ 
                                   
                delete tweetsFiles[pos].tweetID;  
                          
            }
        }
        
        TweetsFile memory tf = TweetsFile(hash, tweetsID);
        tweetsFiles.push(tf);
        for(uint i =0; i < tweetsID.length; i++){
            storedTweets[tweetsID[i]] = tweetsFiles.length - 1;
        }

    }

}
