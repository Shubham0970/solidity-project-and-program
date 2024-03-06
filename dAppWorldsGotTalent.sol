// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DWGotTalent {

    address [] private judgesAddress;
    mapping(address => uint) public  counting;
    address [] private addressOfFinalist;
    address owner;
    // uint [] points;
    uint judgeWeightage; uint audienceWeightage;
    bool isVotingStart = false;
    bool isVoted = false;
    uint count;


    constructor(){
        owner = msg.sender;
    }

    //this function defines the addresses of accounts of judges
    function selectJudges(address[] calldata arrayOfAddresses) isOwner public {
        require(isVotingStart == false,"voting has been started");
        for(uint8 i=0; i<addressOfFinalist.length;i++){
            if(arrayOfAddresses[i] == owner || arrayOfAddresses[i] == addressOfFinalist[i]){
                revert();
            }
            else{
                continue;
            }
        }
        delete judgesAddress;
        judgesAddress = arrayOfAddresses;

    }   

    //this function adds the weightage for judges and audiences
    function inputWeightage(uint _judgeWeightage, uint _audienceWeightage) isOwner public {
        
        judgeWeightage = _judgeWeightage;
        audienceWeightage = _audienceWeightage;
    }

    //this function defines the addresses of finalists
    function selectFinalists(address[] calldata arrayOfAddresses) public isOwner {
        require(isVotingStart == false,"voting has been started");
        for(uint8 i=0; i<judgesAddress.length;i++){
            if(arrayOfAddresses[i] == owner || arrayOfAddresses[i] == judgesAddress[i]){
                revert();
            }
            else{
                continue;
            }
        }
        delete addressOfFinalist;
        addressOfFinalist = arrayOfAddresses;

    }

    //this function strats the Voting process
    function startVoting() isOwner public {
        require(judgeWeightage != 0 || audienceWeightage != 0,"Please write weightage");
        if(judgesAddress.length == 0 || addressOfFinalist.length==0){
            revert();
        }
        else{
            isVotingStart = true;
        }
    }

    //this function is used to cast the vote 
    function castVote(address finalistAddress) public {
        uint judgeVoted; uint audienceVoted;
        require(isVotingStart == true,"wait until Voting starts !");
        for(uint8 i=0; i<=addressOfFinalist.length;i++){

            if(i == addressOfFinalist.length){
                revert();
            }
            else if(addressOfFinalist[i] == finalistAddress){
                break;
            }
            else {
                continue ;
            }
        }
        for(uint8 i=0; i<judgesAddress.length;i++){
            if(judgesAddress[i] == msg.sender){
                judgeVoted = counting[finalistAddress]+1;
            }
        }

        audienceVoted = counting[finalistAddress]+1;

        uint voteTotal = (judgeVoted*judgeWeightage + audienceVoted*audienceWeightage);
        counting[finalistAddress] = voteTotal;

        isVoted = true;
    }

    //this function ends the process of voting
    function endVoting() isOwner public {
        require(isVotingStart == true,"Apologize! Voting has not started yet ");
        require(isVoted == true, "0 candidate voted !");
        isVotingStart = false;
    }

    //this function returns the winner/winners
    function showResult() public view returns (address [] memory) {
        uint max;
        uint result;
        require(isVoted == true,"0 candidate voted ");
        address [] memory temp = new address[](addressOfFinalist.length); 
        for(uint8 i=0; i<addressOfFinalist.length; i++){
            if(counting[addressOfFinalist[i]] > max){
                max = counting[addressOfFinalist[i]];
            }
        }
        for(uint8 i=0; i<addressOfFinalist.length;i++){
            if(counting[addressOfFinalist[i]] == max){
                temp[result] = addressOfFinalist[i];
                result++;
            }
        }

        return temp;
    }

    modifier isOwner() {
        require(msg.sender == owner,"only owner can access!");
        _;
    }

}




// Dapp World's got Talent
// Dapp-World's Got Talent is a show that has come to its season finale. The winner of the show will be decided based on votes from the audience and judges. The weightage of the votes of judges will be different than that of the audience. The points will be assigned to each finalist based on the number of votes each of the finalists receive from the audience and the judges. The contestant with the highest points will be the winner.

// The judges want the voting process to be very secure, which is why they have decided to make use of smart contracts. They want your help to implement the smart contract. You are in charge of the voting procedure and hence, you will be the owner/deployer of the smart contract.

// The flow of the voting process must be as follows:

// 1. Before the start of the voting process
// The addresses of the judges and finalists should be finalized and entered into the smart contract.
// The weightage of the votes for the judges and the finalists should also be finalized and entered into the smart contract.
// Only the owner of the smart contract is allowed to enter these details into the smart contract.
// Only after having these details, the voting procedure can be started.
// 2. After the starting of the voting process
// After checking that all the details have been entered, the voting can be started only by the owner/deployer of the smart contract.
// After starting the process, no one, including the owner of the smart contract, is allowed to enter or modify the details about judges, finalists, or the weightage.
// Everyone can start casting votes for the finalists.
// 3. Ending the process of voting:
// After the voting interval is finished, the voting procedure should end. Only the owner has the access to end the voting process.
// As soon as the voting procedure ends, the smart contract must find the winner of the contest.
// If there are multiple winners, the smart contract should consider all of them.
// After the voting has ended, no one, including the owner of the smart contract, can access any function other than just viewing the winner.
// 4. Results:
// After the voting ends, everyone can see the winner/winners.


// The smart contract must be accessible through the following public functions:

 

// Input:
// selectJudges(address[] arrayOfAddresses): Using this function, the owner of the smart contract can add addresses of the accounts of judges. The panel of judges can be replaced by running the same function with updated parameters.

 

// inputWeightage(uint judgeWeightage, uint audienceWeightage): Using this function, the weightage of the judges and audiences will be sent to the smart contract. The points of a finalist will be calculated as follows: Points = (number of audience who voted him/her * audienceWeightage) + (number of judges who voted him/her * judgeWeightage) The finalist with the maximum points will be considered the winner.

 

// selectFinalists(address[] arrayOfAddresses): Using this function, the owner of the smart contract can add addresses of the accounts of finalists. The finalists can be replaced by running the same function with updated parameters. It goes without saying that the finalists can not be the judges. Also, please note that the owner of the smart contract is allowed to vote, but is not allowed to be the judge or the participant.

 

// startVoting(): Using this function, the owner of the smart contract will start the voting process.

 

// castVote(address finalistAddress): Using this function, the audience and judges can cast their vote for a finalist by selecting the address of the wallet of their favorite finalist. A person can change their vote during the voting process. The last vote casted will be considered.

 

// endVoting(): Using this function, the owner of the smart contract will end the voting process.

 

// Output:
// showResult() returns (address[]): Using this function, everyone will be able to see the addresses of accounts of the winner/winners.

 

// Example 1

// Input/Output
// Function
// Sender address
// Parameter
// Returns
// Input
// selectJudges()
// Owner
// [<Address 1>,<Address 2>]
// Input
// selectFinalists()
// Owner
// [<Address 3>,<Address 4>]
// Input
// inputWeightage()
// Owner
// [2,3]
// Input
// startVoting()
// Owner
// Input
// castVote()
// Owner
// <Address 3>
// Input
// castVote()
// Address 1
// <Address 4>
// Input
// castVote()
// Address 3
// <Address 3>
// Input
// endVoting()
// Owner
// Output
// showResult()
// Owner
// [<Address 3>]
 