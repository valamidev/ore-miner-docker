const { Keypair } = require("@solana/web3.js");
const fs = require("fs");

// Generate a new keypair
const keypair = Keypair.generate();

const secretKey = JSON.stringify(Array.from(keypair.secretKey), null);

if (fs.existsSync("./config/id.json")) {
  console.log("id.json already exists.");

  process.exit(1);
}

// Print the public key (address)
console.log("Public Key:", keypair.publicKey.toString());

// Print the secret key as an array of numbers
console.log("Secret Key:", JSON.stringify(Array.from(keypair.secretKey)));

fs.writeFileSync("./config/id.json", secretKey);
fs.writeFileSync("./config/publicKey", keypair.publicKey.toString());

console.log("NEVER SHARE YOUR SECRET KEY or your id.json file!");
