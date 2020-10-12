# Balance Demo.

#### Here is a contract setup showing how to trade using the [Balancer Pool] (https://kovan.pools.balancer.exchange/#/pool/0x1492b5b01350b7c867185a643f2e59f7be279fd3/) which is on the Kovan testnet. This demo is how to exchange Eth for Dai. It does not go futher to demo how to add single or multi asset liqudity trade in a Shared pool. I picked a pool with DAI. MKR and WETH tokens with no trading fees.

I implemented an inteface contract for both the Balance pool and WETH, and exposed the needed functions for this demo.

Balancer Pool Contract -Kovan = 0x1492B5b01350b7C867185a643F2E59F7BE279Fd3
Dai Contract - Kovan = 0x1528F3FCc26d13F7079325Fb78D9442607781c8C
Weth Contract - Kovan = 0xd0A1E359811322d97991E03f863a0C30C2cF029C

### How to use:

Use the getSpotPrice() function to know the Eth price of the asset.
Use the swapEthForDai() function to get Dai.

### Discussion:

It can be dangerous to rely on the prices inside smart contract since an attacker can use this to manipulate the market price by submitting fake transactions.
