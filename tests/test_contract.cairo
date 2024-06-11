use starknet::{ContractAddress};
use snforge_std::{declare, ContractClassTrait, start_prank, stop_prank, CheatTarget};
use muaccratestingsession::token::TOKEN;
use muaccratestingsession::interface::IERC20::{IERC20Dispatcher, IERC20DispatcherTrait};
use muaccratestingsession::interface::IToken::{ITokenTraitDispatcher, ITokenTraitDispatcherTrait};
const USER_ONE: felt252 = 'Vee';
const USER_TWO: felt252 = 'Kofi';


fn setup() -> ContractAddress {
    let Name: ByteArray = "MuAccra";
    let Symbol: ByteArray = "MAKT";
    let Admin: felt252 = 'HUB';
    let contract = declare("TOKEN").unwrap();
    let mut calldata: Array<felt252> = array![];
    Name.serialize(ref calldata);
    Symbol.serialize(ref calldata);
    Admin.serialize(ref calldata);

    let (contract_address, _) = contract.deploy(@calldata).unwrap();
    let dispatcher = ITokenTraitDispatcher { contract_address };

    start_prank(CheatTarget::One(contract_address), Admin.try_into().unwrap());
    dispatcher.mint_token(USER_ONE.try_into().unwrap(), 10000);
    stop_prank(CheatTarget::One(contract_address),);
    contract_address
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
