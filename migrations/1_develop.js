const CarContract = artifacts.require("CarContract");
// 傳送初始參數 //
module.exports = function(deployer) {
  deployer.deploy(
    CarContract,
    "Initial Model",
    "Initial Plate",
    "Initial Insurance Record",
    "Initial Accident Record",
    "Initial Maintenance Record",
    "Initial VIN"
  );
};  