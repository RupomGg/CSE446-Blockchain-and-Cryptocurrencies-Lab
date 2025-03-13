// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StringConvert {
    bytes private storedBytes;

    function storeString(string memory _str) public {
        storedBytes = bytes(_str);
    }
    
    function getSlicedString(uint _start, uint _end) public view returns (string memory) {
        
        require(_end >= _start, "End index must be greater than or equal to start index");
        require(_end < storedBytes.length, "End index out of bounds");
        
        
        bytes memory result = new bytes(_end - _start + 1);
        
        for (uint i = _start; i <= _end; i++) {
            result[i - _start] = storedBytes[i];
        }
 
        return string(result);
    }
}
