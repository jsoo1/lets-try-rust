(define-module (lets-try-rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public lets-try-rust-hello-world
  (package
    (name "lets-try-rust-hello-world")
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
         "0iqrg9p23s4xz14aqb47116zq94654kr5gq7ljqiv61h9s1i0hwa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'chdir-hello-world
           (lambda _ (chdir "hello_world") #t)))))
    (home-page "https://github.com/jsoo1/lets-try-rust")
    (synopsis "Rust Book Hello World")
    (description "Work throught the Rust Book. Hello World!")
    (license #f)))
