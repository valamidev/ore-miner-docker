const { Keypair } = require("@solana/web3.js");
const fs = require("fs");

// Generate a new keypair
const keypair = Keypair.generate();

const secretKeyString = JSON.stringify(Array.from(keypair.secretKey), null);

if (fs.existsSync("./config/id.json")) {
  console.log("id.json already exists.");

  process.exit(1);
}

// Print the public key (address)
console.log("Public Key:", keypair.publicKey.toString());

// Print the secret key as an array of numbers
console.log("Secret Key:", secretKeyString);

fs.writeFileSync("./config/id.json", secretKeyString);
fs.writeFileSync("./config/publicKey", keypair.publicKey.toBase58());

console.log("NEVER SHARE YOUR SECRET KEY or your id.json file!");
