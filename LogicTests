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
    function timeRemaining() external view returns(uint) {
        return futureTime - block.timestamp;
    }
}
