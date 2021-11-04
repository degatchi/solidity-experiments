
// SPDX-License-Identifier: MIT
// Created by DeGatchi (4/11/2021)
pragma solidity 0.8.9;

// Test 1 is slightly more gas efficient and also allows for storage manipulation.

// test 1: 27724 
// test 2: 27757

contract qek {
    
    struct X {
        uint256 a;
        address b;
    }
    
   mapping(uint256 => X) public x;
  
    event GasUsed(string topic, uint gasUsed);
    
    function test(uint256 id) public {
        uint gasStart = gasleft();
        X storage sX = x[id];
        X memory mX = sX;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(uint256 id) public {
        uint gasStart = gasleft();
        X memory mX = x[id];
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
}
