pragma solidity 0.8.5;

contract Test {
    bool public privs;
    
    event GasUsed(string topic, uint gasUsed);
    
     // testing what the most efficient way to do the `bool&&()` trick is.
    
    bool set1;
    bool set2;
    address user = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    function test() public {
        uint gasStart = gasleft();
        user == msg.sender &&(set1 = true);
        user != msg.sender &&(set2 = true);
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2() public {
        uint gasStart = gasleft();
        user == msg.sender &&(set1 = true) ||
        user != msg.sender &&(set2 = true);
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
}
