pragma solidity ^0.7.3;

interface IBPool {
    function getSpotPrice(address tokenIn, address tokenOut)
        external
        view
        returns (uint256 spotPirce);

    function swapExactAmountOut(
        address tokeonIn,
        uint256 maxAmountIn,
        address tokeonOut,
        uint256 tokenAmountOut,
        uint256 maxPrice
    ) external returns (uint256 tokenAmountIn, uint256 spotPriceAfter);
}
