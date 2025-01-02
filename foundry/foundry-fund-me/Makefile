-include .env

build:; forge build			# The ";" is if you want the command on the same line.

clean:; forge clean

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --account sepoliaPrivatekey --sender 0x6f451aB7946458550D97a318927381C51870F587 --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

