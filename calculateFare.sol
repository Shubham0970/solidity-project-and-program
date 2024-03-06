// SPDX-License-Identifier: GPL-3.0

pragma solidity > 0.4.0;

contract MyContract {

    uint [] distance = [0,2,5,11,23];
    uint fare;

    function finalfare() public returns(uint){
        uint temp = fare;
        fare = 0;
        return temp;
    }

    function calculatefare(uint x, uint y) public  {

        if(x>4 || y>4 ){
            revert();
        }
        else if(x==y){
            fare=0;
            return ;
        }

        else if((x ==0  && y== 1) || (x==1 && y==0) ){
            fare = distance[1];
            return ;
        }
        else{
            if(x > y){
                x = x+y;
                y = x-y;
                x = x-y;
            }
            for(uint i=x; i<y; i++){
                fare += distance[i+1];
            }
        }
        
    }
}




// Calculate Fare
// Objective 

// This is a challenging task to help you apply your problem solving skill using programming.

 

// Task

// There are 5 bus stations named 'A','B','C','D','E'. The distance between 'A' & 'B' is 2 KM. The distance between the next two consecutive stations is 2 times the distance of previous consecutive stations plus 1. Each station has an index starting from 0. So the index of station 'A' is 0, 'B' is 1, 'C' is 2, and so on. The Bus charges 1 Rupee for 1 KM. Calculate the fare required to pay by the passenger if he/she wants to travel between any two given stations.

// 1. Create a public variable finalfare which holds the value of a calculated fare value

// 2. Create a function calculatefare that accepts two arguments that refer to the indexes of the two stations respectively and assigns the calculated value to the finalfare variable.

// * the functions name should match as defined above

 

// Sample Input 0

// 0,1
// Sample Output

// 2
// Sample Input 1

// 3, 1
// Sample Output 1

// 16