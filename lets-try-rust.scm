(define-module (lets-try-rust)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))


(define (lets-try-rust-src name version hash)
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/jsoo1/lets-try-rust")
          (commit version)))
    (file-name (git-file-name name version))
    (sha256
     (base32
      hash))))

(define* (lets-try-rust-chapter #:key name* version* hash dir (deps '()) desc)
  (let ((n (string-append "lets-try-rust-" name*)))
    (package
      (name n)
      (version version*)
      (source (lets-try-rust-src n version* hash))
      (build-system cargo-build-system)
      (arguments
       `(#:cargo-inputs ,deps
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'chdir-hello-world
             (lambda _ (chdir ,dir) #t)))))
      (home-page "https://github.com/jsoo1/lets-try-rust")
      (synopsis "Rust Book Hello World")
      (description desc)
      (license #f))))

(define-public hello-world
  (lets-try-rust-chapter
   #:name* "hello-world"
   #:version* "0.0.0"
   #:hash "0iqrg9p23s4xz14aqb47116zq94654kr5gq7ljqiv61h9s1i0hwa"
   #:dir "hello_world"
   #:desc "Hello Rusty World!"))

(define-public guessing-game
  (lets-try-rust-chapter
   #:name* "guessing-game"
   #:version* "0.1.0"
   #:hash "1nqxirmghsw90cca66b7k0diq00grxbls9h3bvw5qz5blcwm9lrv"
   #:dir "guessing_game"
   #:deps `(("rust-rand" ,rust-rand-0.6.5))
   #:desc "Guess a Rusty number."))
