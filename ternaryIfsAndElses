pragma solidity 0.8.5;

contract Test {
    bool public privs;
    
    event GasUsed(string topic, uint gasUsed);
    
    // testing whether `terinary operators (? :)` are worth using instead of `if, else` && `if, else if`
    // Suprising gas results:
    // Terniary: 26122
    // if, else: 26201
    // if, else if: 26157
    
    uint8 num;
    
    function test(bool choice) public {
        uint gasStart = gasleft();
        choice ? num = 1 : num = 1; 
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(bool choice) public {
        uint gasStart = gasleft();
        if (choice) {
            num = 1;
        } else {
            num = 1;
        }
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
    function test3(bool choice) public {
        uint gasStart = gasleft();
        if (choice) {
            num = 1;
        } else if (!choice) {
            num = 1;
        }
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
}
