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

    event GasUsed(string topic, uint gasUsed);

    // -------------------
    //  For Loop, + vs -
    // -------------------

    // 	25289 gas
    function forUp() external {
        uint gasStart = gasleft();
        for (uint i; i < 10; i++) {}
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }

    // 25209 gas
    function forDown() external {
        uint gasStart = gasleft();
        for (uint i = 10; i > 0; i--) {}
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
}
