//infura TEST//

const Web3 = require('web3');
const path = require('path');

const privateKey = '0c3213249604f403e7858c215c4869f7b4a8f0abc10b0cba82e90c1b1785967c';
const infuraApiKey = 'fb9fed7ac34b432786030f73b27508a5';
const infuraUrl = 'wss://sepolia.infura.io/ws/v3/fb9fed7ac34b432786030f73b27508a5';
const web3 = new Web3(infuraUrl);

// 使用私鑰設置發送交易的帳戶
const account = web3.eth.accounts.privateKeyToAccount(privateKey);
web3.eth.accounts.wallet.add(account);

// 載入 ABI 和合約地址
const contractData = require('./CarContract.json');
const abi = contractData.abi;
const contractAddress = '0x0BcB65dcCA7dEd5feA4421bA537B3Faf69410cFC';
const carContract = new web3.eth.Contract(abi, contractAddress);

// 與合約交互的代碼
carContract.methods.getCarModel().call()
  .then(carModel => {
    console.log("Car Model:", carModel);
  })
  .then(() => {
    // 修改車輛型號（合約擁有者執行）
    return carContract.methods.changeCarModel("New Model").send({ from: account.address });
  })
  .then(() => {
    // 再次獲取車輛型號
    return carContract.methods.getCarModel().call();
  })
  .then(updatedCarModel => {
    console.log("Updated Car Model:", updatedCarModel);
  })
  .catch(error => {
    console.error("Error:", error);
  });
  