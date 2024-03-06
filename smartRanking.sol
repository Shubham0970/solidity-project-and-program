// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SmartRanking {

    uint lastLength;
    struct student{
        uint roll;
        uint markStudent;
    }

    student [] public marksOrignal;

    //this function insterts the roll number and corresponding marks of a student
    function insertMarks(uint _rollNumber, uint _marks) public {
        marksOrignal.push() = student(_rollNumber,_marks);

    }

    //this function returnsthe marks obtained by the student as per the rank
    function scoreByRank(uint _rank) public returns(uint) {
        if(lastLength+1 == marksOrignal.length){
            return marksOrignal[_rank-1].markStudent;
        }
        else{
        sorting();
        return marksOrignal[_rank-1].markStudent;
        }
    }

    //this function returns the roll number of a student as per the rank
    function rollNumberByRank(uint _rank) public returns(uint) {
        if(lastLength+1 == marksOrignal.length){
            return marksOrignal[_rank-1].roll;
        }
        else{
        sorting();
        return marksOrignal[_rank-1].roll;
        }
    }   


    function sorting() internal{
        for(uint8 i=1; i< marksOrignal.length;i++){
            for(uint8 j=0;j<marksOrignal.length;j++){
                if(marksOrignal[j].markStudent < marksOrignal[i].markStudent){
                    student memory temp = marksOrignal[i];
                    marksOrignal[i] = marksOrignal[j];
                    marksOrignal[j] = temp;
                }
            }
            lastLength++;
        }
    }

}





// Smart ranking (Hard version)
// Dinesh has developed an online software that takes exams of students using complex algorithms, which consider multiple factors such as the quality of the solution, submission time, etc. to ensure that no two students obtain the same marks.
// Gilfoyle wants to write a smart contract that stores the results of the students and can give real-time output of the number of students who have submitted their exam.

// This smart contract keeps track of the roll numbers and marks obtained by students. It has the following public functions:

 

// Input:
// insertMarks(uint _rollNumber, uint _marks): This function allows the software to insert the roll number and corresponding marks of a student who has taken the exam. The marks of students and their roll numbers are unsigned integers not greater than or equal to 2^256, i.e.,0 <= _rollNumber < 2^256 and 0 <= _marks < 2^256.

 

// Output:
// scoreByRank(uint rank) This function returns the marks obtained by a student who has a particular rank..

// rollNumberByRank(uint rank) This function returns the roll number of a student who has a particular rank.

 

// Help Gilfoyle develop this smart contract to keep track of the students' results accurately and efficiently.

 

// Example 1

// Call Sequence
// Input/Output
// Function
// Parameter/Returns
// 1
// Input
// insertMarks()
// 1, 75
// 2
// Input
// insertMarks()
// 2, 80
// 3
// Input
// insertMarks()
// 3, 60
// 4
// Output
// scoreByRank()
// 2(input)
// 75(output)
// 5
// Output
// rollNumberByRank()
// 1(input)
// 2(output)
// 6
// Output
// rollNumberByRank()
// 3(input)
// 3(output)
// 7
// Output
// rollNumberByRank()
// 4(input)
// (Transaction fails)
// 8
// Output
// scoreByRank()
// 3(input)
// 60(output)