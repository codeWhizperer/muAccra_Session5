use core::option::OptionTrait;
use core::traits::TryInto;
use starknet::{ContractAddress};
use snforge_std::{declare, ContractClassTrait, start_prank, stop_prank, CheatTarget};
use muaccratestingsession::token::TOKEN;
use muaccratestingsession::interface::IERC20::{IERC20Dispatcher, IERC20DispatcherTrait};
use muaccratestingsession::interface::IToken::{ITokenTraitDispatcher, ITokenTraitDispatcherTrait};
const USER_ONE: felt252 = 'Vee';
const USER_TWO: felt252 = 'Kofi';


fn setup() -> ContractAddress {
    // TODO: declare the contract
    // deploy contract
    // prank admin
    // mint to user
    // return address
    0.try_into().unwrap()
}


#[test]
fn test_name() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
//logic here
}

#[test]
fn test_decimal() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
//   logic here
}

#[test]
fn test_total_supply() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
// logic here
}

#[test]
fn test_user_one_balance() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
//logic here
}

#[test]
fn transfer_from_userone_to_usertwo() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
    start_prank(CheatTarget::One(contract_address), USER_ONE.try_into().unwrap());
    // logic here 
    stop_prank(CheatTarget::One(contract_address),);
}
