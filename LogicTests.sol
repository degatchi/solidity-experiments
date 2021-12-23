pragma solidity ^0.8.7;

contract Test {
    function mod (uint input1, uint input2) pure external returns(uint result) {
        return (input1 % input2);
    }

    // decimals will round to the lowest whole number (i.e, 6.95 === 6)
    function div (uint input1, uint input2) pure external returns(uint result) {
        return (input1 / input2);
    }

    // when block.timestamp > futureTime, it will revert
    uint futureTime = block.timestamp + 5;
    function check() external view returns(uint) {
        return futureTime - block.timestamp;
    }

    uint[] array;
    function arrayChecker() external returns(uint length) {
        array.push(1);
        return array.length;
    }

    event GasUsed(uint gasUsed);

    // -----------------------------
    //  For Loop, + vs -
    //  - small gas diff, however starting from the top may be more gas efficient in some instances, i.e, minting from `i` + going down
    // -----------------------------

    // 	1832 gas used
    function forUp() external {
        uint gasStart = gasleft();
        for (uint i; i < 10; i++) {}
        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }


    // 1840 gas used
    function forDown() external {
        uint gasStart = gasleft();
        for (uint i = 10; i > 0; i--) {}
        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }


    // -----------------------------
    //  Optinal SSTORE
    //  - Check if SSTORE is worth updating w/o of optinal if statement
    // -----------------------------

    uint ref0;
    uint ref1;

    // 4449 gas used
    function forceSSTORE() external {
        uint gasStart = gasleft();
        
        uint number = 10;
        if (number > 11) {}
        ref0 = number;
        ref1 = number;

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }

    // 4475 gas used
    function optinalSSTORE() external {
        uint gasStart = gasleft();
        
        uint number = 10;
        if (number > 11) {}
        if (number > 9) {
            ref0 = number;
            ref1 = number;
        }

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }
}
