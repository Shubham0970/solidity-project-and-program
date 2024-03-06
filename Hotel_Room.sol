// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;

contract hotelRoom{

    address payable public owner;

    enum status {vacant, occupied}
    status currentStatus;

    event Occupant(address occupant_address, uint value);

    constructor(){
        owner = payable(msg.sender);
        currentStatus = status.vacant;
    }

    modifier checkStatus(){
        require(currentStatus == status.vacant,"sorry Currently Occupied !");
        _;
    }

    modifier checkCost(uint _amount){
        require(msg.value >= _amount,"send more then 2 eth");
        _;
    }

    function Book() public payable checkStatus checkCost(2 ether){

        require(currentStatus == status.vacant,"sorry Currently Occupied !");


        currentStatus = status.occupied;
        owner.transfer(msg.value);
        emit Occupant(msg.sender, msg.value);

    }
}