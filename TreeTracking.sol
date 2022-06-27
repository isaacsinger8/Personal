// SPDX-License-Identifier: GPL-3.0
//A model for how a city could encourage citizens to plant trees, and track trees that each citizen has planted 

pragma solidity ^0.8.3;

contract Citizen {

    string public name;
    string public streetaddress;

    //list of trees the citizen enters; this is a dynamic array but its elements are arrays of fixed size (4)
    string[4][] public treelist;

 

    constructor (string memory _name, string memory _streetaddress) {
        name = _name;
        streetaddress = _streetaddress;
    }

    function UpdateName (string memory _newname) public {
        name = _newname;
    }

    function UpdateStreetAddress (string memory _newstreetaddress) public {
        streetaddress = _newstreetaddress;
    }

    function ViewTreeList() public view returns (string[4][] memory) {
        return treelist;
    }

    function ViewTreeRecord(uint _index) public view returns (string[4] memory) {
        return treelist[_index];
    }

    function AddTree(string[4] memory _newtree) public {
        treelist.push(_newtree);
    }

    function DeleteTree(uint _index) public {
        //Note: delete does not change the array length, instead the value at _index is reset to zero (default)
        delete treelist[_index];
    }

    function UpdateTree(uint _index, uint _internalindex, string memory _newattribute) public view {
        string[4] memory tree_to_update;
        tree_to_update = treelist[_index];
        tree_to_update[_internalindex] = _newattribute;
    }



}
