pragma solidity ^0.4.25;

contract Proxy {
    address public manager;
    address public contractAddress;
    address[] private oldAddress;

    constructor(address _address) public {
        manager = msg.sender;
        contractAddress = _address;
    }
    
    modifier onlyManager() {
        require(msg.sender == manager);
        
        _;
    }
    
    function updateContractAddress(address _address) public onlyManager {
        oldAddress.push(contractAddress);
        
        contractAddress = _address;
    }
    
    function getOldAddress(uint256 index) public view returns(address) {
        return oldAddress[index];
    }
}