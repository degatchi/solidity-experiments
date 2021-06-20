pragma solidity 0.8.5;

contract Test {
    bool public privs;
    
    event GasUsed(string topic, uint gasUsed);
    
    address user;
    
    // testing if having a param that isn't used uses a lot of gas
    // compared to if it didn't have that param.
    
    function test1(bool choice) public {
        uint gasStart = gasleft();
        if (choice) {}
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(address to, bool choice) public {
        uint gasStart = gasleft();
        if (choice) {
            user = to;
        }
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
}
