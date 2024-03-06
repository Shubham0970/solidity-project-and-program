




// Dinesh and Gambling
// Dinesh is participating in a gambling game with his friends. The game involves choosing a random integer from an array of integers, and the person who guesses the number chosen by the website wins.However, Dinesh has discovered that the website always selects the second largest integer from the array.

// He needs your help to implement a Solidity function that quickly finds the second largest integer in the array, so he can improve his chances of winning the game.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SecondLargest {

    //this function outputs the second largest integer in the array
    function findSecondLargest(int[] calldata arr) public pure returns (int) {
        int max = type(int).min ; int secondMax = type(int).min; 
        for(uint i=0; i<arr.length; i++){
            if(arr[i]>max){
                secondMax = max;
                max = arr[i];
            }
            else if(arr[i] > secondMax){
                secondMax = arr[i];
            }
        }

        return secondMax;
    }  

}
// The smart contract must contain the following public function:

 

// findSecondLargest(int[] arr) returns (int) {}: This function must return the second largest unique integer in the array. arr is an array of integers where 2 <= arr.length <= 10^4 and -2^255 <= arr[i] <= 2^255 - 1. It is guaranteed that no two integers in the array are same.

 

// Example 1

// Example
// Function
// Parameter
// Returns
// 1
// findSecondLargest()
// [1,2,3,4]
// 3
// 2
// findSecondLargest()
// [-5,8,1,7]
// 7