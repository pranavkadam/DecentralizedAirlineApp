    pragma solidity ^0.5.1;

    contract ASK {
    
    struct Airline{
        bool registered;
    }
    
    mapping(address => Airline) public airlines;    //key address value struct airline
    mapping(address => uint) public deposit;
    
    address public owner;
    uint public amount = 50;
    
    modifier onlyOwner {
    require (msg.sender == owner); //does this make sense? 
    _;
    }
    
    constructor() payable public {
        owner = msg.sender;
       //what should be in the constructor
    }
    
    
    function register() payable public {
        require(msg.value > amount); //new deposit?
        airlines[msg.sender] = Airline(true);
        deposit[msg.sender] = msg.value;
        
    }
    
    function request (address toAirline , uint256 hashOfDetails) public {
        //waiting for front-end
    }
    
    function response (address fromAirline, uint256 hashOfDetails, uint256 done) public {
        //waiting for front-end
    }
    
    function settlePayment  (address payable toAirline) payable public  {
        
        toAirline.transfer(msg.value);
    }
    
    function unRegister (address payable fromAirline) onlyOwner payable public  {
        fromAirline.transfer(deposit[fromAirline]);
        }
    
    
    
    
    
    
    
    
    
}
