# Use of Error Handling By require(),assert(),revert()
## Video Explanation
https://www.loom.com/share/f90508ef6f464ea0843f5886e887f4fc

# Devesh Builders and Earth Lifters Smart Contract

This Solidity smart contract manages a rental system for equipment offered by Devesh Builders and Earth Lifters. Customers can deposit funds, rent equipment, check their balances, and set equipment availability.

## Description

- **Owner:** Address of the contract owner who deployed the contract.
- **Balances:** Mapping of addresses to their deposited balances.
- **EquipmentCodes:** Mapping of item codes to their corresponding names.
- **EquipmentPrices:** Mapping of item codes to their rental prices in ether.
- **EquipmentAvailability:** Mapping of item codes to their availability status.

## Functions

### `constructor()`

- Initializes the contract with predefined equipment codes, prices, and availability.

### `deposit()`

- Allows customers to deposit ether into their account balance.

### `rentItem(uint256 Equipment_Code)`

- Allows customers to rent an item by specifying its code.
- Checks if the item code is valid and available.
- Checks if the customer has enough balance to rent the item.
- Deducts the rental price from the customer's balance and emits an `ItemPurchased` event.

### `getItemCodeChart()`

- Returns a string containing the list of available equipment codes, names, and daily rental prices.

### `checkBalance()`

- Returns the balance of the caller's account.

### `setItemAvailability(uint256 itemCode, bool isAvailable)`

- Allows the owner to update the availability of an item by its code.
- Checks if the item exists before updating its availability status.

## Events

- **`BalanceUpdated`**: Emits when a customer's balance is updated after a deposit.
- **`ItemPurchased`**: Emits when a customer rents an item, providing details of the transaction.
- **`EquipmentAvailabilityUpdated`**: Emits when the availability of an item is updated by the owner.

## Modifiers

- **`onlyOwner`**: Restricts access to functions that can only be called by the contract owner.

## Executing Program
-  We can use remix- an online solidity compiler to run this Program at remix.ethereum.
-  Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension.
- Copy and paste the following code into the file.

 ``` 
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
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.24" (or another compatible version), and then click on the "Devesh Builders and Earth Lifters Smart Contract.sol" button.
    
Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the **Devesh Builders and Earth Lifters Smart Contract** contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the `deposit()` , `rentItem(uint256 Equipment_Code)` , `getItemCodeChart()` ,`checkBalance()`, `setItemAvailability(uint256 itemCode, bool isAvailable)`  function by any existing account in the list. 

## Authors
Devesh Singh Metacrafters deveshsingh5603@gmail.com
## License
This contract is licensed under the MIT License. See `LICENSE` for more details.

