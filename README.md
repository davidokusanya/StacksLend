# StacksLend Protocol: Bitcoin-Secured Decentralized Lending

## Overview

Enterprise-grade lending protocol enabling STX collateralization with Bitcoin-layer security through Stacks L2. Implements institutional risk management frameworks with real-time position monitoring and Clarity-based contract enforcement.

## Technical Architecture

### Data Models

1. **Loan Positions**

   - Borrower principal address
   - Collateral amount (STX)
   - Borrowed amount (STX)
   - Dynamic interest rate
   - Blockchain height tracking
   - Active status flag

2. **User Positions**
   - Total collateral deposited
   - Aggregate borrowed amount
   - Active loan counter

### Core Mechanisms

- **Interest Accrual**  
  Block-based compounding:  
  `Interest = (Principal × Rate × Blocks) / 10,000`

- **Collateral Health**  
  Real-time ratio calculation:  
  `Collateral Ratio = (Collateral Value × 100) / Debt`

- **Position Updates**  
  Atomic balance adjustments with overflow protection

## Protocol Features

### 1. Collateral Management

- **Deposit**  
  `(deposit)` - Lock STX into Bitcoin-secured vault

  - Full balance transfer enforcement
  - Global deposit tracking

- **Withdrawal**  
  `(withdraw amount)`
  - Collateral ratio preservation checks
  - Anti-liquidation safeguards

### 2. Debt Operations

- **Borrow**  
  `(borrow amount)`

  - Minimum 150% collateral ratio enforcement
  - Debt ceiling controls

- **Repayment**  
  `(repay amount)`
  - Principal-first settlement
  - Interest accrual suspension

### 3. Risk Mitigation

- **Liquidations**  
  `(liquidate user)`

  - 130% collateral threshold trigger
  - Full position closure
  - Debt cancellation

- **Protocol Parameters**  
  Owner-controlled safeguards:
  ```clarity
  (set-minimum-collateral-ratio new-ratio)
  (set-liquidation-threshold new-threshold)
  (set-protocol-fee new-fee)
  ```

## Error Framework

| Code                               | Condition                    | Resolution Path                       |
| ---------------------------------- | ---------------------------- | ------------------------------------- |
| ERR-NOT-AUTHORIZED (u100)          | Unprivileged access attempt  | Verify sender permissions             |
| ERR-INSUFFICIENT-COLLATERAL (u101) | Collateral ratio breach      | Deposit additional STX or reduce debt |
| ERR-INVALID-AMOUNT (u102)          | Zero-value transaction       | Submit positive integer amount        |
| ERR-LOAN-NOT-FOUND (u103)          | Nonexistent position         | Verify loan ID/user address           |
| ERR-LOAN-ACTIVE (u104)             | Duplicate operation          | Complete existing loan cycle          |
| ERR-INSUFFICIENT-BALANCE (u105)    | Over-withdrawal attempt      | Verify available liquidity            |
| ERR-LIQUIDATION-FAILED (u106)      | Healthy position liquidation | Monitor collateral ratios             |
| ERR-INVALID-PARAMETER (u107)       | Protocol setting violation   | Maintain 110-500% parameter ranges    |

## Governance Parameters

| Parameter                | Default | Range    | Update Authority |
| ------------------------ | ------- | -------- | ---------------- |
| Minimum Collateral Ratio | 150%    | 110-500% | Contract Owner   |
| Liquidation Threshold    | 130%    | ≥110%    | Contract Owner   |
| Protocol Fee             | 1%      | ≤10%     | Contract Owner   |

## Compliance Features

- Bitcoin-anchored transaction finality
- STX/BTC price oracle integration points
- Clarity-native reentrancy protection
- Overflow/underflow safeguards

## Interaction Guide

### Prerequisites

- Clarinet SDK
- Stacks.js
- Testnet STX
