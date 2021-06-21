pragma solidity 0.8.5;

contract Test {
    event GasUsed(string topic, uint gasUsed);
   
    address public addy1;
    uint24 public num1;
    uint256 largeuint1;
  
    // Testing: whether bit packing in param makes a difference.
    // Result: gas is saved when bit packing! (`test1`: 31,645, `test2`: 31,602)

    function test1(
        address addy_,
        uint256 uint256_,
        uint24 uint24_
    ) public {
        uint gasStart = gasleft();
        addy1 = addy_;
        largeuint1 = uint256_;
        num1 = uint24_;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }
    
    function test2(
        address addy_,
        uint24 uint24_,
        uint256 uint256_
    ) public {
        uint gasStart = gasleft();
        addy1 = addy_;
        largeuint1 = uint256_;
        num1 = uint24_;
        uint gasUsed = gasStart = gasleft();
        emit GasUsed('test1', gasUsed);
    }   
}
