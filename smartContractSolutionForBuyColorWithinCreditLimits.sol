// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Holi {

    uint rd = 40;
    uint bl = 40;
    uint grn = 30;

    // this function is used to buy the desired colour
    function buyColour(string calldata colour, uint price) public {
        if(keccak256(bytes(colour)) == keccak256(bytes("green"))  && (price <= grn)){
                grn = grn - price;
        }
        else if(keccak256(bytes(colour)) == keccak256(bytes("red")) && (price <= rd)){
                rd = rd - price;
        }
        else if(keccak256(bytes(colour)) == keccak256(bytes("blue")) && (price <= bl)){
                bl = bl - price;
        }
        else{
            revert();
        }
    }

    //this functions will return credit balance
    function credits() public view returns(uint) {
        return rd + grn + bl - 10;
    }

}





// Smart Contract Solution for Buying Colors within Credit Limits
// Ram is super excited about Holi and wants to give Shyam a special gift - a smart contract that lets him buy the most colorful colors for the festival!
// Shyam can use this smart contract to buy red, green, and blue colors with an initial balance of 100 credits. However, Ram has set a maximum credit limit for each color so that Shyam does not go overboard. For Red and Blue, Shyam can only spend up to 40 credits each, and for Green, he can spend up to 30 credits. To make sure that Shyam doesn't overspend, the smart contract has two user-friendly functions:

 

// Input:
// buyColour(string colour, uint price): Shyam can use this function to choose his desired color and the price he wants to pay for it. This function checks if Shyam has enough credits and also ensures that he doesn't exceed the maximum limit set by Ram for each color. The colour should be one of these 3- "red", "blue", "green". If the colour is anything other than these 3 strings, the transaction should fail.

 

// Output:
// credits() returns (uint n): This function will return the credits that are remaining with Shyam. Since, Shyam has 100 credits at the beginning, the credits will be within constraints 0 to 100, i.e.0 <=n < 100.

 

// The problem is to create a smart contract that allows Shyam to buy colors for Holi while ensuring that he stays within the credit limits and doesn't overspend.

 

// Example 1

// Call Sequence
// Input/Output
// Function
// Parameter/Returns
// 1
// Output
// credits()
// 100
// 2
// Input
// buyColour()
// "red", 5
// 3
// Output
// credits()
// 95
// 4
// Input
// buyColour()
// "green", 30
// 5
// Output
// credits()
// 65
// 6
// Input
// buyColour()
// "green", 1
// (Transaction failes)
// 7
// Output
// credits()
// 65
 