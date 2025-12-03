# Student Registry dApp - Polygon Amoy Testnet

A full-stack decentralized application (dApp) for managing student records on the Polygon Amoy Testnet using a relayer architecture.

## 📋 Project Structure

```
StudentRegistry/
├── contracts/
│   └── StudentRegistry.sol    # Smart contract
├── scripts/
│   └── deploy.js              # Deployment script
├── server/
│   └── server.js              # Backend relayer server
├── client/
│   └── dashboard.html         # Frontend dashboard
├── .env                       # Environment variables (create this)
├── hardhat.config.js          # Hardhat configuration
└── package.json
```

## 🚀 Step-by-Step Setup Guide

### Step 1: Get Your API Keys and Wallet

1. **Get Infura API Key:**
   - Go to [Infura.io](https://infura.io)
   - Sign up/login and create a new project
   - Copy your API Key

2. **Get Testnet MATIC:**
   - Get a wallet private key (create a new wallet or use MetaMask)
   - Get testnet MATIC from [Polygon Faucet](https://faucet.polygon.technology/)
   - Make sure to select "Amoy" testnet

### Step 2: Configure Environment Variables

1. Open `.env` file in the project root
2. Replace the placeholders:
   ```
   INFURA_API_KEY=your_actual_infura_api_key_here
   PRIVATE_KEY=your_wallet_private_key_here
   ```

   **⚠️ IMPORTANT:** Never share your private key or commit it to Git!

### Step 3: Deploy the Smart Contract

1. Open terminal in the project directory
2. Compile the contract:
   ```bash
   npx hardhat compile
   ```

3. Deploy to Polygon Amoy:
   ```bash
   npx hardhat run scripts/deploy.js --network amoy
   ```

4. **COPY THE DEPLOYED CONTRACT ADDRESS** from the console output
   - It will look like: `0x1234567890abcdef...`

5. Update `server/server.js`:
   - Find the line: `const CONTRACT_ADDRESS = "YOUR_DEPLOYED_CONTRACT_ADDRESS_HERE";`
   - Replace with your actual contract address

### Step 4: Start the Backend Server

1. Open a new terminal
2. Navigate to the project directory
3. Start the server:
   ```bash
   node server/server.js
   ```

   You should see:
   ```
   Server connected to wallet: 0x...
   Contract address: 0x...
   🚀 Server running on http://localhost:3000
   ```

4. **Keep this terminal open** - the server must stay running!

### Step 5: Open the Frontend

1. Open `client/dashboard.html` in your web browser
   - You can double-click the file, or
   - Right-click → Open with → Your browser

2. The dashboard should load and connect to your server

## 🎯 How to Use

### Adding a Student:
1. Fill in the "Add Student" form:
   - Student ID (number)
   - Name
   - Course
2. Click "Add Student"
3. Wait for transaction confirmation
4. The student will appear in the list

### Looking Up a Student:
1. Enter a Student ID in "Quick Lookup"
2. Click "Lookup"
3. View the student details

### Viewing All Students:
1. Click "Refresh List" in the "Student List" section
2. All students will be displayed in a table

## 🔧 Troubleshooting

### "Contract address not set" error:
- Make sure you updated `CONTRACT_ADDRESS` in `server/server.js` after deployment

### "Insufficient funds" error:
- Get more testnet MATIC from the faucet

### Server won't start:
- Check that `.env` file has correct values
- Make sure port 3000 is not already in use

### Frontend can't connect:
- Make sure the server is running on `http://localhost:3000`
- Check browser console for errors

## 📝 Important Notes

- This is a **testnet** application - no real money is involved
- The wallet in `.env` pays for all gas fees (relayer pattern)
- Users don't need MATIC in their wallets to use the dApp
- The contract owner (your wallet) controls who can add students

## 🎓 Next Steps

- Add more features to the contract
- Implement authentication
- Add student update/delete functions
- Deploy to Polygon mainnet (when ready)

## 📚 Resources

- [Hardhat Documentation](https://hardhat.org/docs)
- [Polygon Documentation](https://docs.polygon.technology/)
- [Ethers.js Documentation](https://docs.ethers.io/)

---

**Good luck with your project! 🚀**

