// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.5; 

contract bytesTest {
    
    bytes20 public encoded1;
    bytes32 public encoded2;
    address public addy1;
    address public addy2;
    

    function encode(address user) public {
        encoded1 = bytes20(user);
        encoded2 = keccak256(abi.encode(user));
    }
        
    function decode(bytes20 a, bytes32 b) public {
        addy1 = address(a);
        addy2 = address(uint160(bytes20(b)));
    }
}
