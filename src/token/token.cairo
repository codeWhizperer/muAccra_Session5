#[starknet::contract]
pub mod TOKEN {
    use openzeppelin::token::erc20::{ERC20Component, ERC20HooksEmptyImpl};
    use starknet::{ContractAddress, get_caller_address};
    use muaccratestingsession::interface::IToken::ITokenTrait;
    component!(path: ERC20Component, storage: erc20, event: ERC20Event);

    //    ERC20 Mixin
    #[abi(embed_v0)]
    #[abi(embed_v0)]
    impl ERC20MixinImpl =
        ERC20Component::ERC20MixinImpl<ContractState>;
    impl ERC20InternalImpl = ERC20Component::InternalImpl<ContractState>;

    #[storage]
    struct Storage {
        #[substorage(v0)]
        erc20: ERC20Component::Storage,
        admin: ContractAddress
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        ERC20Event: ERC20Component::Event,
    }

    #[constructor]
    fn constructor(
        ref self: ContractState, name: ByteArray, symbol: ByteArray, admin: ContractAddress
    ) {
        self.erc20.initializer(name, symbol);
        self.admin.write(admin);
    }

    #[abi(embed_v0)]
    impl ITokenImpl of ITokenTrait<ContractState> {
        fn get_admin(self: @ContractState) -> ContractAddress {
            self.admin.read()
        }

        fn mint_token(ref self: ContractState, recipient: ContractAddress, amount: u256) {
            assert(self.admin.read() == get_caller_address(), 'only admin can mint');
            self.erc20._mint(recipient, amount);
        }
    }
}
