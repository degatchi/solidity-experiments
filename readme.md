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

### `bool&&()Efficiency.sol`
Tested what the most efficient way to do the `bool&&()` trick is.
`test`: 26471
`test2`: 26190

<br />

### `terinaryIfsAndElses`
Tested whether `terinary operators (? :)` are worth using instead of `if, else` && `if, else if` <br />
Suprising gas results:<br />
    Terniary: 26122<br />
    if, else: 26201<br />
    if, else if: 26157
    
<br />

### `paramOrHardcode`
Tested whether using the param to set a variable would be cheaper in gas compared to setting it manually. The results were staggering. <br />
Test1 (manual): 45,942 <br />
Test2 (param): 28,970 <br />

<br />
