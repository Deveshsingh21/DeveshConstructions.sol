# Use of Error Handling By require(),assert(),revert()
# Video Explanation

# Devesh Builders And Earth Lifters
This program shows a simple contract made in Solidity to Rent Equipments from a Construction Equipment named Devesh Builders And Earth Lifters.
## Description
The 'DeveshBuildersAndEarthLifters' contract allows user to deposit amount ,rent different construction Equipment , get the equipment list , check users balance and set item availability for particular equipment by owner.

It contains state variables ```owner``` storing the address of contract owner.

It contains mappings 

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

## Usage

To use this contract:
1. Deploy it to a supported Ethereum network.
2. Interact with the contract using a compatible wallet or dApp.
3. Use functions like `deposit`, `rentItem`, `checkBalance`, and `setItemAvailability` as per your requirements.

## License

This contract is licensed under the MIT License. See `LICENSE` for more details.

