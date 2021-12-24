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


    // -----------------------------
    //  != vs >
    // -----------------------------

    // 33 gas used
    function largerThan() external {
        uint number = 10;
        uint gasStart = gasleft();
        
        require(9 < 10, "");

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }

    // 36 gas used
    function notEqual() external {
        uint number = 10;
        uint gasStart = gasleft();
        
        require(9 != 10, "");

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }


    // -----------------------------
    //  Array length
    // -----------------------------

    struct Array {
        uint256[] array0;
    }
    
    function checker() external pure returns(uint) {
        Array memory structTest;

        return structTest.array0.length;
    }


    // -----------------------------
    //  Rounding
    // -----------------------------

    // daysPassed1 === 1
    // daysPassed2 === 1
    // daysPassed1 === 0
    function round() external pure returns(uint daysPassed1, uint daysPassed2, uint daysPassed3) {
        uint256 timePassed = 90000;
        daysPassed1 = timePassed < 1 days ? 0 : timePassed / 86400;
        daysPassed2 = timePassed / 86400;
        daysPassed3 = timePassed / 100000;
    }

    
    // -----------------------------
    //  struct vs single line SSTORE
    // -----------------------------

    struct STRUCT {
        uint256 a;
        uint256 b;
        address c;
    }

    mapping(uint8 => STRUCT) private structo;

    // initialising: 46722 gas used
    // after initialising: 6922 gas used
    function structSSTORE() external {
        uint gasStart = gasleft();

        STRUCT memory s = STRUCT({
            a: 1,
            b: 1,
            c: address(0)
        });

        structo[0] = s;

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }

    // initialising: 46618 gas used
    // after initialising: 6818 gas used
    function singleLineSSTORE() external {
        uint gasStart = gasleft();

        STRUCT storage s = structo[1];

        s.a = 1;
        s.b = 2;
        s.c = address(0);

        uint gasUsed = gasStart - gasleft();
        emit GasUsed(gasUsed);
    }
}   
