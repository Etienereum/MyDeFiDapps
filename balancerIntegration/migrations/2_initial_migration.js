// const IWEth = artifacts.require("IWEth");
// const IBPool = artifacts.require("IBPool");
const MyBalancerContract = artifacts.require("MyBalancerContract");


module.exports = function (deployer) {
    deployer.deploy(
        MyBalancerContract,
        0x1492B5b01350b7C867185a643F2E59F7BE279Fd3,
        0x1528F3FCc26d13F7079325Fb78D9442607781c8C,
        0xd0A1E359811322d97991E03f863a0C30C2cF029C
    );
};
