// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    
    address[] club_members;

    mapping (address => bool) isMember;   

    function join() public payable {
        require(!isMember[msg.sender]);
        require(msg.value == 1 ether, "cost is 1 ether");

        club_members.push(msg.sender);
    }

    function join_referrer(address payable  _referrer_add) public payable  {
        require(isMember[_referrer_add],"sorry");
        join();
        _referrer_add.transfer(100000000000000000);
                
    }

    function get_members() public view  returns(address[] memory){
        return club_members;
    }
}





// Club referral system
// Objective 

// This is a challenging task to help you apply your problem-solving skill using solidity with use of address and creating an famous referral system.

 

// Task Overview

// There is a swimming club named "swimmer's club" in Mumbai. In order to join the club one has to pay an amount of 1 ETH. If a new joiner has a referral address of the one who is already a member of the club, 10% of the joining amount is awarded to the referrer. note that this is compulsory that the referral address must be the present member of the club otherwise this offer will be invalid. Create a Smart contract that represents the club and functions to join the club.

// Task 

// 1. Create an array to store members addresses.

// 2. Create a function join so that when a new member has no referral address he/she can join directly using this function. after successful joining, add the new member address to the array.

// 3. Create a function join_referrer that accepts variable type addresses as an argument. Check if the referrer is already a member or not, if not then revert, if yes then transfer the award to the referrer's address and add a new user in the array.

// 4. Create a function get_members which returns the array of members that are declared in the first step.

// * the functions name should match as defined above

 

// Sample Input 0

// -
// Sample Output

// -