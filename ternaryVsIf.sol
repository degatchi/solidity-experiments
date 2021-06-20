pragma solidity 0.8.5;

contract Test {
    event GasUsed(string topic, uint gasUsed);
    
    bool public set1;
    bool public set2;
    address public addy1;
    address public addy2;
    uint8 public num1;
    uint8 public num2;

    function test1(uint8 num) public {
        uint gasStart = gasleft();
        num != 0 ? num1 = num : num;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(uint8 num) public {
        uint gasStart = gasleft();
        if (num != 0) {
            num2 = num;
        }
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
}
