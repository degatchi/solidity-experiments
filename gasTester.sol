pragma solidity 0.8.5;

contract Test {
    bool public privs;
    
    event GasUsed(string topic, uint gasUsed);
    
    function test(bool priv) public {
        uint gasStart = gasleft();
        priv && (privs = true);
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(bool priv) public {
        uint gasStart = gasleft();
        if (priv) {
            privs = true;
        }
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
}