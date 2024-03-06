// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ChcolateShop {

    uint public chocolatesInBag;
    mapping(uint => int) chocolateBag;
    uint len;

    // this function allows gavin to buy n chocolates
    function buyChocolates(uint n) public {
        chocolatesInBag += n;
        chocolateBag[len] = int(n);
        len++;
    }

    // this function allows gavin to sell n chocolates
    function sellChocolates(uint n) public {
        if(n == 0){
            revert();
        }
        else{
            require(chocolatesInBag>=n,"out of stock");
            chocolatesInBag -= n;
            chocolateBag[len] = -int(n);
            len++;
        }
    }

    // this function returns total chocolates present in bag
    // function chocolatesInBag() public view returns(int){
    //     return int(totalChocolates);
    // }

    // this function returns the nth transaction
    function showTransaction(uint n) public view returns(int) {
        require(n <= len);
        return chocolateBag[n-1];

    }

    //this function returns the total number of transactions
    function numberOfTransactions() public view returns(uint) {
        return len;
    }

}




// Gavin and the chocolate shop (Hard version)
// Gavin recently started a chocolate shop and has a bag to keep all of the chocolates, which he calls the "chocolate bag." He regularly imports chocolates from a chocolate factory and sells them to customers through his shop. However, Gavin has a poor memory and often forgets the count of chocolates in the chocolate bag. To solve this issue, he wants to use smart contracts to keep track of the number of chocolates.

// The smart contract should be accessible through the following three public functions:

 

// Input:
// buyChocolates(uint n): This function will allow Gavin to purchase n number of chocolates and add them to the chocolate bag. The input must be an unsigned integer, with the constraint 0 <=n < 2^256.


// sellChocolates(uint n): This function will allow Gavin to sell n number of chocolates from the chocolate bag. The input must be an unsigned integer, with the constraint 0 <=n < 2^256.

 

// Output:
// chocolatesInBag() returns (int n): This function will return the total number of chocolates in the chocolate bag, where n is an unsigned integer. It is guaranteed that the number of chocolates in the chocolate bag will never exceed or be equal to 2^256, i.e.0 <=n < 2^256.


// showTransaction(uint n) returns (int txn): This function will return the nth transaction. If the nth transaction is one where chocolates were bought, then the output(txn) will be the number of chocolates bought.  If the nth transaction is one where chocolates were sold, then the output(txn) will be negative of the number of chocolates sold i.e. -1 * (number of chocolates sold). 


// numberOfTransactions() returns (uint n): his function will return the total number of transactions done by Gavin in his shop. i.e. a total number of times chocolates were bought and sold in his shop. 

// It is guaranteed that the number of transactions will never exceed or be equal to 2^256, i.e. 0 < n < 2^256.

 

// Help Gavin solve this problem by creating the required smart contract.

 

// Example 1

// Call Sequence
// Input/Output
// Function
// Parameter/Returns
// 1
// Input
// buyChocolates()
// 5
// 2
// Input
// sellChocolates()
// 4
// 3
// Output
// chocolatesInBag()
// 1
// 4
// Output
// numberOfTransactions()
// 2
// 5
// Output
// showTransaction()
// 1(input)
// 5(output)
// 6
// Output
// showTransaction()
// 2(input)
// -4(output)
 