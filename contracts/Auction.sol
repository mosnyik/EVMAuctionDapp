// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Auction{
    // we want to collect the bidder's and map it to their bid amount
    mapping (address => uint256) biddersData;
    // keeps track of our highest bid amount
    uint256 highestBidAmount;
    // keep tract of the address of the highest bidder's address
    address highestBidder;

    // We would use the Epoch time format to convert and set our time
    // The auction start time - in this test case, it would start counting
    // once we deploy our contract
    uint256 startTime = block.timestamp;
    // the auction end time
    uint256 endTime;

    // FUNCTIONS

    // put bit to allow for bidders to create new bids

    // public - because we want the bidder to be able 
    // to call the function from outside the contract - from the frontend
    // payable - because we want the contract to store the bidded eth
    function putBid()public payable{

        // add up all the user's bids within the bid session
        uint256 calculatedAmount = biddersData[msg.sender] + msg.value;

        // We make sure that the bid is still running and hass not ended to allow 
        // new users to put a bid
        require(endTime > block.timestamp, "The bid has ended, wait for the next auction");

        // before we place a bid
        require(msg.value > 0, "Your bid amount can not be less then zero");
           // Update the biddersData with the calling address 
           // and the address bid amount
           // We use the local variable calculatedAmount to sum up all the user's
           // bid within the session

           // We want to make sure that our highestBidAmount is always > the 
           // calculatedAmount
            require(calculatedAmount > highestBidAmount, "There is already a bid higher than your present bid ammount, try with a higher bid amount");
            // set the bidders cumulative bidAmount to calculatedAmount
           biddersData[msg.sender] = calculatedAmount;
           // update the higestBidAmount
           highestBidAmount = calculatedAmount;
           // set the higest bidder's address to the address of the present caller of the function
           highestBidder = msg.sender;
    }

    // lets test that the putBid actually helps us collect and store eth

    // the we have disscursed public before,
    // view - it means this function would not modify the blockchain state
    // return - it gives us a return type of uint for the amount of eth in the contract
    function getContractBal() public view returns(uint256){
        return address(this).balance;
    }

    // we want to get the bidder's bid amount
    function getBiddersBal(address _address) public view returns(uint256){
        // use the bidders address as a key to return the bidders ballance
        return biddersData[_address];
    }

    // get highest bidder amount to decide the winner of the auction

    function highestBid() public view returns(uint256){
        return highestBidAmount;
    }

    // get highest bidder details to get the address of the auction winner

  function bidWinner() public view returns(address){
        return highestBidder;
    }

    // set the endtime for our auction - it takes a uint value which is the 
    // time period in for the aution in seconds and adds to the startTime value.
    function putEndtime(uint256 _endTime) public {
        endTime = _endTime;
    }

    // get my set endTime from epotch from https://www.epochconverter.com/

    // lets allow users to wthdraw there bids when the auction has ended

    function withdrawBid( address payable _address) public {
        // check if the address passed placed a bid, if so refund them their ETH
        // if they did not win the bid.
        // Note the bidder can only place a bid with more than Zero value, 
        // so if the value is less than zero, we simply not run the code
        if(biddersData[_address]>0 && biddersData[_address]<highestBidAmount){
            // if the condition passes, we use the amount the bidder placed 
            // and refund them
            _address.transfer(biddersData[_address]);
        }
    }

}