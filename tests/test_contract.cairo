use core::serde::Serde;
use core::result::ResultTrait;
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
    let TOKEN_NAME: ByteArray = "MUACCRA";
    let TOKEN_SYMBOL: ByteArray = "MTK";
    let ADMIN: felt252 = 'Francis';
    let mut calldata = array![];
    // declare the contract
    TOKEN_NAME.serialize(ref calldata);
    TOKEN_SYMBOL.serialize(ref calldata);
    ADMIN.serialize(ref calldata);
    let contract = declare("TOKEN").unwrap();
    let (contract_address, _) = contract.deploy(@calldata).unwrap();
    start_prank(CheatTarget::One(contract_address), ADMIN.try_into().unwrap());
    let dispatcher = ITokenTraitDispatcher { contract_address };
    dispatcher.mint_token(USER_ONE.try_into().unwrap(), 10000);
    stop_prank(CheatTarget::One(contract_address));

    // return address
    contract_address
}


#[test]
fn test_name() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
    let token_name = dispatcher.name();
    assert(token_name == "MUACCRA", 'invalid token name');
}

// #[test]
fn test_decimal() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
    let token_decimal = dispatcher.decimals();
    assert(token_decimal == 18, 'invalid token decimal');


}

// #[test]
fn test_total_supply() {
    let contract_address = setup();
    let _dispatcher = IERC20Dispatcher { contract_address };
}

#[test]
fn test_user_one_balance() {
    let contract_address = setup();
    let dispatcher = IERC20Dispatcher { contract_address };
    let user = to_address(USER_ONE);
    let user_one_balance = dispatcher.balance_of(user);
    assert(user_one_balance == 10000, 'invalid');

}

// #[test]
fn transfer_from_userone_to_usertwo() {
    let contract_address = setup();
    let _dispatcher = IERC20Dispatcher { contract_address };
    start_prank(CheatTarget::One(contract_address), USER_ONE.try_into().unwrap());
    // logic here 
    stop_prank(CheatTarget::One(contract_address),);
}


fn to_address(name:felt252) -> ContractAddress{
    name.try_into().unwrap()
}