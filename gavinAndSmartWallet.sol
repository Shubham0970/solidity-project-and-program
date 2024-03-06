// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SmartWallet {

    uint private balance;
    address private owner;
    mapping(address => bool) permissionedAddress;

    constructor(){
        owner = msg.sender;
        permissionedAddress[msg.sender] = true;
    }

    //this function allows adding funds to wallet
    function addFunds(uint amount) isHaveAccess() public {
        require(amount <= 10000 && balance<10000,"amount can not exceed 10000");
        balance += amount;
    }

    //this function allows spending an amount to the account that has been granted access by Gavin
    function spendFunds(uint amount) isHaveAccess() public {
        require(balance > 0,"Insufficient Balance");
        balance -= amount;
    }

    //this function grants access to an account and can only be accessed by Gavin
    function addAccess(address x) isOwner public {
        permissionedAddress[x] = true;
    }

    //this function revokes access to an account and can only be accessed by Gavin
    function revokeAccess(address x) isOwner public {   
        permissionedAddress[x] = false;
    }

    //this function returns the current balance of the wallet
    function viewBalance() isHaveAccess public view returns(uint) {
        return balance;
    }


    modifier isHaveAccess() {
        require(permissionedAddress[msg.sender]==true,"only owner can access");
        _;
    }
    modifier isOwner() {
        require(owner == msg.sender,"only owner have authority");
        _;
    }

}




// Gavin and smart wallet
// Meet Gavin, a proud business owner who works alongside his children. Gavin loves his kids, but sometimes they need access to the funds stored in his bank account, which he's not always comfortable sharing with them.

// That's where you come in! Gavin wants you to help him create a wallet and develop a smart contract that he can deploy and own after verification. Gavin wants to be the only one who can grant or revoke access to the wallet, and anyone with access should be able to add, spend, and view its balance.
// Gavin is hoping that you can set the maximum limit of the wallet to 10000 and ensure that its balance never exceeds this amount. The wallet should start with an initial balance of 0.

// Gavin would like the smart contract to include the following public functions:

 

// Input:
// addFunds(uint amount): Allows adding funds to the wallet's balance, but the amount should not exceed 10000. Only Gavin and the addresses he has granted access to can use this function.

// spendFunds(uint amount): Allows spending funds from the wallet's balance. Only John and the addresses he has granted access to can use this function. The balance cannot be negative.

// addAccess(address x): Grants access to address x to the smart contract. Only Gavin (contract owner) has the authority to execute this function.

// revokeAccess(address y):Revokes the access of address y to the smart contract. Only Gavin (contract owner) has the authority to execute this function.

 

// Output:
// viewBalance() Displays the current balance of the wallet. Only Gavin and the addresses he has granted access to can use this function.

 

// Example 1

// Input/Output
// Function
// Sender address
// Parameter/Returns
// Input
// addAccess()
// Address 1
// <Address 2>
// Input
// addFunds()
// Address 2
// 11000
// (Transaction fails)
// Input
// addFunds()
// Address 2
// 10000
// Input
// spendFunds()
// Address 2
// 10
// Output
// viewBalance()
// Address 2
// 9990
// Input
// revokeAccess()
// Address 1
// <Address 2>
// Input
// spendFunds()
// Address 2
// 10
// (Transaction fails)
 