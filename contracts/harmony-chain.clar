;; Title: HarmonyChain Rights Protocol
;; A decentralized music rights management protocol on Bitcoin L2
;; enabling transparent ownership tracking, seamless transfers, and 
;; verifiable provenance for audio catalogs in the Web3 era

;; SYSTEM CONSTANTS

(define-constant contract-admin tx-sender)

;; Error codes
(define-constant err-unauthorized (err u200))
(define-constant err-forbidden (err u201))
(define-constant err-invalid-input (err u202))
(define-constant err-duplicate (err u203))
(define-constant err-not-found (err u204))
(define-constant err-invalid-address (err u205))

;; Limits
(define-constant max-metadata-length u256)

;; STATE STORAGE

(define-non-fungible-token harmony-rights uint)
(define-data-var rights-id-tracker uint u0)

;; DATA MAPS

(define-map rights-metadata
  uint
  (string-ascii 256)
)
(define-map rights-owners
  uint
  principal
)

;; PRIVATE FUNCTIONS

(define-private (authorized?
    (rights-id uint)
    (caller principal)
  )
  (is-eq caller (unwrap! (map-get? rights-owners rights-id) false))
)

(define-private (valid-metadata? (data (string-ascii 256)))
  (let ((length (len data)))
    (and (>= length u1) (<= length max-metadata-length))
  )
)

(define-private (valid-address? (addr principal))
  true
)

(define-private (mint-rights (data (string-ascii 256)))
  (let ((new-id (+ (var-get rights-id-tracker) u1)))
    (try! (nft-mint? harmony-rights new-id tx-sender))
    (map-set rights-metadata new-id data)
    (map-set rights-owners new-id tx-sender)
    (var-set rights-id-tracker new-id)
    (ok new-id)
  )
)