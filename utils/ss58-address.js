const help = `--ss58-address <address>: Calculate the Substrate address that corresponds to a native EVM address.`;
const crypto = require('@polkadot/util-crypto');

const convertToSubstrateAddress = (evmAddress, prefix = 42) => {
  const addressBytes = Buffer.from(evmAddress.slice(2), 'hex');
  const prefixBytes = Buffer.from('evm:');
  const convertBytes = Uint8Array.from(Buffer.concat([ prefixBytes, addressBytes ]));
  const finalAddressHex = crypto.blake2AsHex(convertBytes, 256);
  return crypto.encodeAddress(finalAddressHex, prefix);
}

module.exports = () => {
  if (process.argv.length < 4) {
    console.error('Please provide the <address> parameter.');
    console.error(help);
    process.exit(9);
  }
  
  const address = process.argv[3];
  
  return convertToSubstrateAddress(address);
};
