### `gasTester`
Go to remix, paste in `gasTestor.sol` and input your varaibles inbetween the `gasleft()`s

## Findings
### `bytesToAddress`
To convert bytes to address, we used `bytes20(example_address)` and to convert back we use `address(bytes20_result)`. The reason why is because the `address` type is *20 bytes*, not *32 bytes*. Even with a `bytes32` conversion (`address(uint160(bytes20(bytes32Address))`), it doesn't come out as the original.

