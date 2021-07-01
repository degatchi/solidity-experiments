pragma solidity 0.8.5;

contract Test {
    address[] addresses01;
    
    event GasUsed(string topic, uint gasUsed);
    
    function test(
        address[] memory addresses1
    ) public {
        uint gasStart = gasleft();
        
        addresses01 = addresses1;
    
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(
        address[] memory addresses1
    ) public {
        uint gasStart = gasleft();
        
        addresses01[0] = addresses1[0];
        
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
    function test3(
        address addresses1
    ) public {
        uint gasStart = gasleft();
        
        addresses01[0] = addresses1;

        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test2', gasUsed);
    }
    
}
