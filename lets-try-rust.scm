(define-module (lets-try-rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public lets-try-rust
  (package
    (name "lets-try-rust")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jsoo1/lets-try-rust")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1h9zid7bi19qga3a8a2d4x3ma9wf1njmj74s4xnw7nzqqf3dh750"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs ()))
    (home-page "https://github.com/jsoo1/lets-try-rust")
    (synopsis "The Rust Book tm")
    (description "Work throught the Rust Book")
    (license #f)))
