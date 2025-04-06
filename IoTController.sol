// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract IoTControl {
    struct ControlData {
        uint256 Servo;
        string led;
    }

    ControlData public _controlData;


    constructor() {
        _controlData.Servo = 0;
        _controlData.led = "RED";
    }

    function setData(uint256 servo, string memory led) public {
        require(servo <= 180, "Value out of range");
        bytes32 ledHash = keccak256(abi.encodePacked(led));
        require(
            ledHash == keccak256(abi.encodePacked("RED")) ||
                ledHash == keccak256(abi.encodePacked("GREEN")) ||
                ledHash == keccak256(abi.encodePacked("BLUE")),
            "Invalid color"
        );
        _controlData.Servo = servo;
        _controlData.led = led;
    }

    function getControlData() public view returns (ControlData memory) {
        return (_controlData);
    }
}
