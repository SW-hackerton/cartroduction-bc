const HDWalletProvider = require("truffle-hdwallet-provider-klaytn");
const GASLIMIT = '20000000'
const URL = `https://api.baobab.klaytn.net:8651`
const PRIVATE_KEY = '...'


module.exports = {
  networks: {  
    baobab: {
      provider: () =>{
        return new HDWalletProvider(PRIVATE_KEY, URL);
      } ,
      network_id: '1001',
      gas: GASLIMIT,
      gasPrice: null,
    },
  }
}