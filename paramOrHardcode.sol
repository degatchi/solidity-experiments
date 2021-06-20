pragma solidity 0.8.5;

contract Test {
    event GasUsed(string topic, uint gasUsed);
    
    bool public set1;
    bool public set2;

    function test1(bool choice) public {
        uint gasStart = gasleft();
        set1 = true;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(bool choice) public {
        uint gasStart = gasleft();
        set2 = choice;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
}
