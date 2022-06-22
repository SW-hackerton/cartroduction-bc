const cont = artifacts.require("./Cartroduction.sol");
const fs = require('fs');

module.exports = function(deployer) {
  var name = "Cartroduction";
  var symbol = "CTD";

  deployer.deploy(cont)
    .then(() => {
      if (cont._json) {
        fs.writeFile(
          'deployedABI',
          JSON.stringify(cont._json.abi),
          (err) => {
            if (err) throw err
            console.log("파일에 ABI 입력 성공");
          })
      }

      fs.writeFile(
        'deployedAddress',
        cont.address,
        (err) => {
          if (err) throw err
          console.log("파일에 주소 입력 성공");
        })
    })
};
