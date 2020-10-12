pragma solidity ^0.7.3;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.2.1-solc-0.7/contracts/token/ERC20/IERC20.sol";
import "./IBPool.sol";
import "./IWEth.sol";

contract MyBalancerContract{
    
    //Contract pointers
    IBPool public bPool;
    IERC20 public dai;
    IWEth public weth;
    
    constructor(address _bPool, address _dai, address _weth) {
        bPool = IBPool(_bPool);
        dai = IERC20(_dai);
        weth = IWEth(_weth);
    }
    
    // func to buy Eth with Dai
    function swapEthForDai(uint daiAmount) external payable {
        //Convert our Dai to WapEth since the balancer pool uses WETH
        weth.deposit{ value: msg.value }();
        
        //Get the current price of the Dai Token and this is going to be our MaxPrice
        uint price = 110 * bPool.getSpotPrice(address(weth), address(dai)) / 100;
        //MaxAmmonut of WEth we can pay
        uint wethAmount = price * daiAmount;
        
        weth.approve(address(bPool), wethAmount);
        bPool.swapExactAmountOut(
            address(weth),
            wethAmount,
            address(dai),
            daiAmount,
            price 
            );
            
        dai.transfer(msg.sender, daiAmount);
        uint wethBalance = weth.balanceOf(address(this));
        if (wethBalance > 0){
            // weth.withdraw(wethBalance);
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function getSpotPrice() external view returns (uint){
        return bPool.getSpotPrice(address(weth), address (dai));
    }
}