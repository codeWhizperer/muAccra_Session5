use starknet::ContractAddress;
#[starknet::interface]
pub trait ITokenTrait<TState> {
    fn get_admin(self: @TState) -> ContractAddress;
    fn mint_token(ref self: TState, recipient: ContractAddress, amount: u256);
}

