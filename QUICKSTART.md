# 🚀 Quick Start Guide - Student Registry dApp

Follow these steps **in order** to get your dApp running!

## ⚙️ Prerequisites

- Node.js installed (v16 or higher)
- A code editor (VS Code recommended)
- MetaMask browser extension (for wallet connection)

---

## 📝 STEP 1: Get Your API Keys

### 1.1 Get Infura API Key
1. Go to https://infura.io
2. Sign up or log in
3. Click "Create New Key"
4. Select "Web3 API" as the product
5. Name it "StudentRegistry" (or anything you like)
6. **Copy your API Key** (starts with something like `abc123...`)

### 1.2 Get Testnet MATIC
1. Install MetaMask browser extension if you don't have it
2. Create a new wallet or use existing one
3. Switch network to "Polygon Amoy Testnet"
   - If you don't see it, add it manually:
     - Network Name: Polygon Amoy
     - RPC URL: https://polygon-amoy.infura.io/v3/YOUR_INFURA_KEY
     - Chain ID: 80002
     - Currency Symbol: MATIC
4. Get testnet MATIC from: https://faucet.polygon.technology/
   - Select "Amoy" network
   - Paste your wallet address
   - Request tokens

### 1.3 Get Your Private Key
1. In MetaMask, click the three dots (⋮) next to your account
2. Click "Account Details"
3. Click "Show Private Key"
4. Enter your password
5. **Copy the private key** (starts with `0x...`)
   - ⚠️ **NEVER share this or commit it to Git!**

---

## 🔧 STEP 2: Configure Environment

1. Open the `.env` file in the project
2. Replace the placeholders:

```
INFURA_API_KEY=paste_your_infura_key_here
PRIVATE_KEY=paste_your_private_key_here
```

**Example:**
```
INFURA_API_KEY=abc123def456ghi789
PRIVATE_KEY=0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
```

---

## 🏗️ STEP 3: Deploy the Smart Contract

Open a terminal in the project folder and run:

```bash
# Compile the contract
npm run compile

# Deploy to Polygon Amoy
npm run deploy
```

**IMPORTANT:** After deployment, you'll see output like:
```
StudentRegistry deployed to: 0x1234567890abcdef...
```

**COPY THIS ADDRESS!** You'll need it in the next step.

---

## 🔌 STEP 4: Update Server Configuration

1. Open `server/server.js`
2. Find this line (around line 19):
   ```javascript
   const CONTRACT_ADDRESS = "YOUR_DEPLOYED_CONTRACT_ADDRESS_HERE";
   ```
3. Replace it with your actual contract address:
   ```javascript
   const CONTRACT_ADDRESS = "0x1234567890abcdef..."; // Your actual address
   ```
4. Save the file

---

## 🖥️ STEP 5: Start the Backend Server

1. Open a **new terminal** (keep it open!)
2. Navigate to the project folder
3. Run:
   ```bash
   npm run server
   ```

You should see:
```
Server connected to wallet: 0x...
Contract address: 0x...
🚀 Server running on http://localhost:3000
```

**Keep this terminal running!** Don't close it.

---

## 🌐 STEP 6: Open the Frontend

1. Open `client/dashboard.html` in your web browser
   - You can double-click it, or
   - Right-click → "Open with" → Your browser
2. The dashboard should load automatically

---

## ✅ STEP 7: Test Your dApp

### Test 1: Add a Student
1. Fill in the form:
   - Student ID: `1001`
   - Name: `John Doe`
   - Course: `Computer Science`
2. Click "Add Student"
3. Wait a few seconds for the transaction
4. You should see a success message with a transaction hash

### Test 2: View All Students
1. Click "Refresh List" in the Student List section
2. You should see the student you just added

### Test 3: Lookup a Student
1. Enter `1001` in the Quick Lookup field
2. Click "Lookup"
3. You should see the student details

---

## 🐛 Troubleshooting

### "Cannot find module" error
- Run: `npm install` again

### "Insufficient funds" error
- Get more testnet MATIC from the faucet

### Server won't start
- Check that `.env` file has correct values
- Make sure port 3000 is not in use
- Check that contract address is set correctly

### Frontend shows errors
- Make sure the server is running on port 3000
- Open browser console (F12) to see detailed errors
- Check that you updated the contract address in server.js

### "Contract address not set" error
- Make sure you updated `CONTRACT_ADDRESS` in `server/server.js`

---

## 📚 What's Next?

- Try adding more students
- Experiment with different student IDs
- Check your transactions on [Polygonscan Amoy](https://amoy.polygonscan.com/)
- Read the full README.md for more details

---

**Congratulations! 🎉 Your dApp is running!**

