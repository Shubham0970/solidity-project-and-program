// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DiamondLedger {

    mapping (uint => uint) diamondsWeights;
    uint8 length;
    //this function imports the diamonds
    function importDiamonds(uint[] calldata weights) public {
        for(uint8 i=0; i < weights.length; i++){
            diamondsWeights[length] = weights[i];
            length++;
        }
    }

    //this function returns the total number of available diamonds as per the weight and offset
    function availableDiamonds(uint weight, uint allowance) public view returns(uint) {
        uint totalAvailable;

        for(uint i=0; i<length; i++){
            if(weight - allowance <= diamondsWeights[i] && diamondsWeights[i] <= weight + allowance){
                totalAvailable++;
            }
        }

        return totalAvailable;
    }

}




// Diamond tracking (Hard version)
// Richard and his team are working on a decentralized diamond trading platform. They plan to use blockchain technology to record the ownership of each diamond and ensure that there are no fake diamonds in the market.
// Richard has hired you to write a smart contract for their platform that will help them keep track of the diamonds based on their weight.

// TWrite a smart contract that has the following public functions:

 

// Input:
// importDiamonds(uint[] memory weights): This function takes an array of unsigned integers that represent the weights of the diamonds being imported. It is guaranteed that the weight of each diamond will be in the range 0 <= weight <=1000.

 

// Output:
// availableDiamonds(uint weight, uint allowance): This function takes two unsigned integers as input - weight and allowance. The weight parameter represents the weight of the diamonds being queried, and the allowance parameter represents the maximum allowable difference between the weight of a diamond and the queried weight. The function should return the number of diamonds in the diamondWeights array that fall within the weight range of 'weight - allowance' to 'weight + allowance', inclusive. The function should return the number of diamonds in the diamondWeights array that fall within the weight range of weight - allowance to weight + allowance, inclusive.It is guaranteed that the total number of diamonds never exceed 2^256.

 

// Help Richard and his team in their mission to revolutionize the diamond industry by providing them with a smart contract that will enable them to keep track of the diamonds on their platform.

 

// Example 1

// Call Sequence
// Input/Output
// Function
// Parameter/Returns
// 1
// Input
// importDiamonds()
// [4,8,3,3]
// 4
// Output
// availableDiamonds()
// 1(input), 0(output)
// 4
// Output
// availableDiamonds()
// 2,1(input), 2(output)
// 4
// Output
// availableDiamonds()
// 4,1(input), 3(output)
// 4
// Output
// availableDiamonds()
// 8, 0(input), 1(output)