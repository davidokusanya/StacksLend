;; Title: 
;; StacksLend: Bitcoin-Secured Decentralized Lending Protocol
;; A Layer 2 Native Money Market Built on Stacks Blockchain

;; Summary:
;; Enables trustless STX collateralization with Bitcoin-backed security through Stacks L2
;; Institutional-grade lending protocol featuring dynamic risk parameters and real-time liquidations

;; Description:
;; StacksLend operates as a non-custodial liquidity protocol where users can:
;; - Deposit STX tokens as Bitcoin-anchored collateral
;; - Borrow against positions with algorithmic interest rates
;; - Participate in liquidations of undercollateralized positions
;;
;; Built natively on Stacks Layer 2, leveraging Bitcoin's security model for:
;; - Immutable loan terms enforced by Clarity smart contracts
;; - Transparent collateral verification through Bitcoin's proof chain
;; - Regulatory-compliant financial operations via Stacks' L2 architecture
;;

;; Constants and Error Codes
;; Contract Owner
(define-constant CONTRACT-OWNER tx-sender)

;; Error Codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-COLLATERAL (err u101))
(define-constant ERR-INVALID-AMOUNT (err u102))
(define-constant ERR-LOAN-NOT-FOUND (err u103))
(define-constant ERR-LOAN-ACTIVE (err u104))
(define-constant ERR-INSUFFICIENT-BALANCE (err u105))
(define-constant ERR-LIQUIDATION-FAILED (err u106))
(define-constant ERR-INVALID-PARAMETER (err u107))

;; Protocol Parameters
(define-constant MAX-COLLATERAL-RATIO u500) ;; Maximum allowed collateral ratio (500%)
(define-constant MIN-COLLATERAL-RATIO u110) ;; Minimum required collateral ratio (110%)
(define-constant MAX-PROTOCOL-FEE u10)      ;; Maximum protocol fee (10%)