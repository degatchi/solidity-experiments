Experimental contracts that try to break Solidity and find new techniques.

----

### `gasTester.sol`
Go to remix, paste in `gasTestor.sol` and input your varaibles inbetween the `gasleft()`s

<br />

# Useful Information
- https://ethereum.stackexchange.com/questions/37549/array-or-mapping-which-costs-more-gas
- https://ethereum.stackexchange.com/questions/77099/efficient-bit-packing

<br />

# Notes
- Clearing `address` variales in code: use `address(bytes20(''));`, this will set the address to `0x0000000000000000000000000000000000000000`. The reason we do this is because when you have an `address` or `bytes20` param, you are forced to input an address. However, you can set it with `address(bytes20(''));` within the code.

<br />

# Bytes of Types
To reduce gas costs, Solidity tightly packs variables where possible so that they are stored within the same 32 bytes. <br/>
<br />
Key: <br />
`bool`: 1 byte (8 bits) <br />
`address`: 20 bytes <br />
`uint8`: 1 bytes <br />
`uint256`: 32 bytes (uint8 * 32) <br />

<br />

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

### `ternaryIfsAndElses.sol`
Tested whether `terinary operators (? :)` are worth using instead of `if, else` && `if, else if` <br />
Suprising gas results:<br />
    Ternary: 26122<br />
    if, else: 26201<br />
    if, else if: 26157
    
<br />

### `paramOrHardcode.sol`
Tested whether using the param to set a variable would be cheaper in gas compared to setting it manually. The results were staggering. <br />
Test1 (manual): 45,942 <br />
Test2 (param): 28,970 <br />

<br />

### `bytes20vsAddress.sol`
Tested whether: `converting a bytes20 param to an address and assigning with that value` is cheaper than: `using an address param and assigning with that value`.
<br/>
Small difference, but still suprising results: <br />
byes20 param: 26,360 <br />
address param: 26,391 <br />

<br />

### `ternaryVsIf.sol`
Testing whether: using a ternary is more efficient than a single if statement. <br />
Results: Ternary wins by being more compact and being ever so slightly less in gas (Ternary: 29,004 && If: 29,021) <br />

<br />

### `bitPackingParam.sol`
Testing: whether bit packing in param makes a difference.
Results: gas is saved when bit packing! (`test1`: 31,645, `test2`: 31,602)
