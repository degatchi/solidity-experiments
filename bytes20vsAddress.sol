pragma solidity 0.8.5;

contract Test {
    event GasUsed(string topic, uint gasUsed);
    
    bool public set1;
    bool public set2;
    address public addy1;
    address public addy2;

    function test1(bytes20 addy) public {
        uint gasStart = gasleft();
        addy1 = address(addy);
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(address addy) public {
        uint gasStart = gasleft();
        addy2 = addy;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function encode(address addy) public pure returns(bytes20) {
        return bytes20(addy);
    }
}
