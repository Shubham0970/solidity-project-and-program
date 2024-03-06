// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Bookstore {

    struct booksInStore{
        string title;
        string author;
        string publication;
        bool available;
    }

    // booksInStore store;
    address private owner;
    booksInStore[] availableBooks;
    uint[] ID;

    //  booksInStore [] availabilityByInput;

    constructor(){
        owner = msg.sender;
    }

    // this function can add a book and only accessible by gavin
    function addBook(string calldata _title, string calldata _author, string calldata _publication) isOwner public {
        availableBooks.push() = booksInStore(_title,_author,_publication,true);
    
    }

    // this function makes book unavailable and only accessible by gavin
    function removeBook(uint _id) isOwner public {
            availableBooks[_id-1].available = false;
    }

    // this function modifies the book details and only accessible by gavin
    function updateDetails(
        uint _id, 
        string calldata _title, 
        string calldata _author, 
        string calldata _publication, 
        bool available) isOwner public {
            availableBooks[_id-1] = booksInStore(_title,_author,_publication,available);
        }

    // this function returns the ID of all books with given title
    function findBookByTitle(string calldata _title) public returns (uint[] memory)  {

        delete ID;
       
        for(uint i=0; i<availableBooks.length; i++){
            if(msg.sender == owner && keccak256(abi.encodePacked(availableBooks[i].title)) == keccak256(abi.encodePacked(_title))){
                    ID.push() = i+1;
            }
            else if(availableBooks[i].available == true && keccak256(abi.encodePacked(availableBooks[i].title)) == keccak256(abi.encodePacked(_title))){
                ID.push() = i+1;
            }
            else{
                continue;
            }
        }
        
        return ID;
    }

    // this function returns the ID of all books with given publication
    function findAllBooksOfPublication (string calldata _publication) public returns (uint[] memory)  {

        delete ID;
       
        for(uint i=0; i<availableBooks.length; i++){
            if(msg.sender == owner && keccak256(abi.encodePacked(availableBooks[i].publication)) == keccak256(abi.encodePacked(_publication))){
                ID.push() = i+1;
            }
            else if(availableBooks[i].available == true && keccak256(abi.encodePacked(availableBooks[i].publication)) == keccak256(abi.encodePacked(_publication))){
                ID.push() = i+1;
            }
            else{
                continue ;
            }
        }
        return ID;
    }

    // this function returns the ID of all books with given author
    function findAllBooksOfAuthor (string calldata _author) public returns (uint[] memory)  {
        
        delete ID;
       
        for(uint i=0; i<availableBooks.length; i++){
            if(msg.sender == owner && keccak256(abi.encodePacked(availableBooks[i].author)) == keccak256(abi.encodePacked(_author))){
                ID.push() = i+1;
            }
            else if(availableBooks[i].available == true && keccak256(abi.encodePacked(availableBooks[i].author)) == keccak256(abi.encodePacked(_author))){
                ID.push() = i+1;
            }
            else{
                continue ;
            }
        }
        return ID;
    }


    // this function returns all the details of book with given ID
    function getDetailsById(uint _id) public view returns (
        string memory _title, 
        string memory _author, 
        string memory _publication, 
        bool _available)  {

            if(msg.sender == owner){
                return (
                availableBooks[_id-1].title,
                availableBooks[_id-1].author,
                availableBooks[_id-1].publication,
                availableBooks[_id-1].available
            );
            }
            
            else if(availableBooks[_id-1].available == true){
            return (
                availableBooks[_id-1].title,
                availableBooks[_id-1].author,
                availableBooks[_id-1].publication,
                availableBooks[_id-1].available
            );
            }
            else{
                revert();
            }
            
        }


        modifier  isOwner(){
            require(owner == msg.sender,"only owner can be access !");
            _;
        }

}




// Gavin and the bookstore
// Gavin is starting a new bookstore and wants to use a smart contract to securely store data and make the process easy for customers. Gavin needs functionalities to be enabled for customers to directly check the availability of books using the smart contract. He needs your help in implementing the smart contract with the following functionalities:

// The smart contract must contain the following public function:

 

// Input:
// addBook(string title, string author, string publication): This function should only be accessible by Gavin (owner). Using this function, he can add a book by specifying the title, author, and publication of the book respectively.

// The book should automatically get an ID of type uint assigned to it in the smart contract. The ID of the newly added book should be one greater than the ID of the previously added book, or 1 if no books have been added yet.

 

// removeBook(uint id): This function should only be accessible by Gavin (owner). Using this function, Gavin can make a book unavailable in cases like the book being sold, the book getting damaged, etc.

 

// updateDetails(uint id, string title, string author, string publication, bool available): This function should only be accessible by Gavin (owner). Using this function, Gavin can modify the details of a book whose ID is id. If there is no book with ID id in the database, the transaction must fail. ( Check the explanation of getDetailsById() function below for better understanding).

// The smart contract can have a boolean indicating the availability of a book. This boolean value should be true if the book is available and false if the book is not available.

 

// Output:
// findBookByTitle(string title) returns (uint[]): This function is accessible by everyone. If Gavin (owner) calls this function, an array of IDs of all the books (available as well as unavailable) in the database that match the title given in the parameter should be returned. If this function is accessed by any address other than Gavin's (owner), then the function must return the IDs of only the available books which match the title given in the parameter.

 

// findAllBooksOfPublication (string publication) returns (uint[]): This function is accessible by everyone. If Gavin (owner) calls this function, an array of IDs of all the books (available as well as unavailable) in the database that match the publication given in the parameter should be returned. If this function is accessed by any address other than Gavin's (owner), then the function must return the IDs of only the available books which match the publication given in the parameter.

 

// findAllBooksOfAuthor (string author) returns (uint[]): This function is accessible by everyone. If Gavin (owner) calls this function, an array of IDs of all the books (available as well as unavailable) in the database that match the author given in the parameter should be returned. If this function is accessed by any address other than Gavin's (owner), then the function must return the IDs of only the available books which match the author given in the parameter.

 

// getDetailsById(uint id) returns (string title, string author, string publication, bool available): This function is accessible by everyone. This function must return the following details of the book which has an ID id. The title, author, publication, and a boolean value respectively. This boolean value must be true if the book is available and false if the book is not available. If there is no book with the given ID in the database, then the transaction must fail. If this function is accessed by any address other than Gavin's (owner), then the function must return the details only if the book is available, else the transaction must fail.

 

// Example 1

// Input/Output
// Function
// Sender address
// Parameter
// Returns
// Input
// addBook()
// Owner
// "Animal Farm", "George Orwell", "Secker and Warburg"
// Output
// getDetailsById()
// Address 1
// 1
// "Animal Farm", "George Orwell", "Secker and Warburg", true
// Output
// findBookByTitle()
// Address 2
// "Animal Farm"
// [1]
// Input
// removeBook()
// Address 1
// 1
// (Transaction fails)
// Input
// removeBook()
// Owner
// 1
// Output
// getDetailsById()
// Address 2
// 1
// (Transaction fails)
// Output
// getDetailsById()
// Owner
// 1
// "Animal Farm", "George Orwell", "Secker and Warburg", false
 