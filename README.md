# HarmonyChain Rights Protocol

### A Decentralized Music Rights Management Protocol on Bitcoin L2

The **HarmonyChain Rights Protocol** is a decentralized Clarity smart contract system built on the Stacks Bitcoin Layer-2. It enables **transparent music rights ownership tracking**, **seamless transfer of rights**, and **verifiable provenance of audio catalogs** in the Web3 era.

This protocol is designed to serve as the foundation for decentralized rights registries, music NFT platforms, and interoperable Web3 licensing systems.

---

## 🚀 System Overview

The HarmonyChain protocol abstracts music rights as **non-fungible tokens (NFTs)**.
Each registered music right is:

* **Unique**: Represented by an NFT (`harmony-rights`)
* **Transparent**: Metadata and ownership stored on-chain
* **Transferable**: Secure ownership transfers across principals
* **Provable**: Immutable provenance history, enforced by Clarity

Core features include:

* **Registration** of music rights by protocol admin
* **On-chain metadata storage** with flexible length constraints
* **Secure rights ownership transfers** between principals
* **Error handling** for authorization, validation, and duplicates

---

## ⚙️ Contract Architecture

### **Core Components**

* **Non-Fungible Token Definition**

  * `harmony-rights`: NFT that uniquely represents a music right.
  * Backed by a monotonically increasing `rights-id`.

* **State Variables**

  * `rights-id-tracker`: Tracks the next available rights ID.

* **Data Maps**

  * `rights-metadata`: Maps each `rights-id` to its descriptive metadata.
  * `rights-owners`: Maps each `rights-id` to its current owner principal.

* **Constants**

  * `contract-admin`: Initial deployer with exclusive registration authority.
  * Error codes (`err-unauthorized`, `err-invalid-input`, etc.)
  * Metadata length limits (`max-metadata-length`).

---

### **Functions**

#### 🔒 Private Functions

* `authorized?` – Checks if caller owns a given rights ID.
* `valid-metadata?` – Ensures metadata length is within bounds.
* `valid-address?` – Placeholder validation for principal address.
* `mint-rights` – Mints new NFT, sets metadata, ownership, and increments tracker.

#### 🌐 Public Functions

* `register-rights (data)`

  * Admin-only function to register a new right.
  * Validates metadata and mints a new NFT.

* `transfer-rights (rights-id, recipient)`

  * Allows owner to transfer rights to another principal.
  * Ensures caller authorization and recipient validity.

---

## 🔄 Data Flow

**1. Registration**

* Admin calls `register-rights(data)`.
* Metadata validated → NFT minted → Ownership + metadata stored.

**2. Ownership Transfer**

* Current owner calls `transfer-rights(rights-id, recipient)`.
* Authorization checked → NFT transferred → Owner mapping updated.

---

## 🏗 Example Architecture (High-Level)

```
+-----------------------------+
|       Bitcoin Layer 1       |
| (Settlement, Final Security)|
+-----------------------------+
              |
              v
+-----------------------------+
|      Stacks Layer 2         |
|  Clarity Smart Contracts    |
|   HarmonyChain Protocol     |
+-----------------------------+
              |
   +----------+-----------+
   |                      |
   v                      v
Music NFT Marketplaces   Rights Registries / DAOs
   (User-facing apps)        (Governance + Licensing)
```

---

## 📜 Error Handling

| Error Code | Meaning                  |
| ---------- | ------------------------ |
| `u200`     | Unauthorized (not admin) |
| `u201`     | Forbidden (not owner)    |
| `u202`     | Invalid input            |
| `u203`     | Duplicate entry          |
| `u204`     | Not found                |
| `u205`     | Invalid address          |

---

## ✅ Future Extensions

* **Royalties Management**: Attach royalty splits per rights ID.
* **Metadata Standards**: Enforce IPFS/Arweave metadata schemas.
* **Multi-Signature Admin**: Replace single admin with DAO governance.
* **On-chain Licensing**: Enable conditional use rights & streaming licenses.

---

## 🧩 Summary

The **HarmonyChain Rights Protocol** provides a **minimal, extensible, and production-ready foundation** for music rights tokenization on Bitcoin L2. By leveraging Stacks’ smart contract infrastructure, it ensures **security, transparency, and interoperability** for decentralized music ecosystems.
