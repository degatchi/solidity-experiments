Experimental contracts that try to break Solidity and find new techniques.

----

### `gasTester`
Go to remix, paste in `gasTestor.sol` and input your varaibles inbetween the `gasleft()`s

# Findings
### `bytesToAddress.sol`
To convert bytes to address, we used `bytes20(example_address)` and to convert back we use `address(bytes20_result)`. The reason why is because the `address` type is *20 bytes*, not *32 bytes*. Even with a `bytes32` conversion (`address(uint160(bytes20(bytes32Address))`), it doesn't come out as the original.

<br />

### `paramCanceling.sol`
Canceling a param with a bool doesn't spend too much gas! (in our test it was a 100 gas difference, in favour of the single param when compared to the double param).

<br />

### `bool && ()` trick (found 20/06/2020)
For example: 
`boolParam && (boolVariable = bool` 
is the same as 
`if (boolParam) {
    boolVariable = bool;
}`
however saves gas and is more compact. 

<br />
