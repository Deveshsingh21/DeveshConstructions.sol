// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DeveshBuildersAndEarthLifters {
    address public owner;
    mapping(address => uint256) public balances;
    mapping(uint256 => string) public EquipmentCodes;
    mapping(uint256 => uint256) public EquipmentPrices;
   
    mapping(uint256 => bool) public EquipmentAvailability;

    event BalanceUpdated(address indexed customer, uint256 newBalance);
    event ItemPurchased(address indexed customer, uint256 itemCode, string itemName, uint256 itemPrice);
    event EquipmentAvailabilityUpdated(uint256 itemCode, bool isAvailable);

    constructor() {
        owner = msg.sender;
        
        
        EquipmentCodes[1] = "Excavators";
        EquipmentPrices[1] = 5 ether;
        EquipmentAvailability[1] = true;

        EquipmentCodes[2] = "RockTrucks";
        EquipmentPrices[2] = 4 ether;
       EquipmentAvailability[2] = true;

        EquipmentCodes[3] = "Trenchers";
        EquipmentPrices[3] = 7 ether;
        EquipmentAvailability[3] = true;

        EquipmentCodes[4] = "Tower_Crane";
        EquipmentPrices[4] = 10 ether;
        EquipmentAvailability[4] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        
        balances[msg.sender] += msg.value;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);
    }

    function rentItem(uint256 Equipment_Code) external {
    string memory itemName = EquipmentCodes[Equipment_Code];
    uint256 Equipment_Price = EquipmentPrices[Equipment_Code];
    uint256 balance = balances[msg.sender];

    if (bytes(itemName).length == 0) {
        revert("Invalid item code");
    }

    require(balance >= Equipment_Price, "Insufficient balance to rent Equipment");
    require(EquipmentAvailability[Equipment_Code] , "Equipment Quantity not available to rent ");
  

    balances[msg.sender] -= Equipment_Price;
 
    assert(balances[msg.sender] >= 0); 

    emit ItemPurchased(msg.sender, Equipment_Code, itemName, Equipment_Price);
}



    function getItemCodeChart() external pure returns (string memory) {
        return  "1: Excavators (5 ether per day)  2: RockTrucks (4 ether per day)   3: Trenchers (7 ether per day)  4: Tower_Crane (10 ether per day)   ";
    }

    function checkBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function setItemAvailability(uint256 itemCode, bool isAvailable) external onlyOwner {
        if (bytes(EquipmentCodes[itemCode]).length == 0) {
            revert("Item does not exist");
        }

        EquipmentAvailability[itemCode] = isAvailable;
        emit EquipmentAvailabilityUpdated(itemCode, isAvailable);
    }
}
