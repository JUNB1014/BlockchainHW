// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarContract {
    address public owner; // 合約的擁有者地址 
    string public carModel; // 存儲汽車型號
    string public carPlate; // 存儲汽車車牌號
    string public insuranceRecord; // 存儲保險記錄
    string public accidentRecord; // 存儲事故記錄
    string public maintenanceRecord; // 存儲維護記錄
    string public vehicleIdentificationNumber; // 車輛識別號碼

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this operation");
        _;
    }

    // 構造函數 初始化 //
    constructor(
        string memory _initialModel,
        string memory _initialPlate,
        string memory _initialInsuranceRecord,
        string memory _initialAccidentRecord,
        string memory _initialMaintenanceRecord,        
        string memory _initialVIN
    ) {
        owner = msg.sender; 
        carModel = _initialModel;
        carPlate = _initialPlate;
        insuranceRecord = _initialInsuranceRecord;
        accidentRecord = _initialAccidentRecord;
        maintenanceRecord = _initialMaintenanceRecord;
        vehicleIdentificationNumber = _initialVIN;
    }

     // 修改函數  //
    function changeCarModel(string memory _newModel) public onlyOwner { 
        carModel = _newModel;
    }

    function changeCarPlate(string memory _newPlate) public onlyOwner {
        carPlate = _newPlate;
    }

    function changeInsuranceRecord(string memory _record) public onlyOwner {
        insuranceRecord = _record;
    }

    function changeAccidentRecord(string memory _record) public onlyOwner {
        accidentRecord = _record;
    }

    function changeMaintenanceRecord(string memory _record) public onlyOwner {
        maintenanceRecord = _record;
    }

    function changeVehicleIdentificationNumber(string memory _vin) public onlyOwner {
        vehicleIdentificationNumber = _vin;
    }

    // 讀取函數 //
    function getCarModel() public view returns (string memory) {
        return carModel;
    }

    function getCarPlate() public view returns (string memory) {
        return carPlate;
    }

    function getInsuranceRecord() public view returns (string memory) {
        return insuranceRecord;
    }

    function getAccidentRecord() public view returns (string memory) {
        return accidentRecord;
    }

    function getMaintenanceRecord() public view returns (string memory) {
        return maintenanceRecord;
    }

    function getVehicleIdentificationNumber() public view returns (string memory) {
        return vehicleIdentificationNumber;
    }
}
