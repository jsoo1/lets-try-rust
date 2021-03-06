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
   #:hash "0wmgkzrd0lq4mah3vpbra1ip01i5nxjd5bxh2mkbv80mza0nh42a"
   #:dir "hello_world"
   #:desc "Hello Rusty World!"))

(define-public guessing-game
  (lets-try-rust-chapter
   #:name* "guessing-game"
   #:version* "0.1.0"
   #:hash "0j8pc4ms45wrr7371sinbgx7y0lb33xz8fliwkxgqahhfx92ss3x"
   #:dir "guessing_game"
   #:deps `(("rust-rand" ,rust-rand-0.6))
   #:desc "Guess a Rusty number."))

(define-public variables
  (lets-try-rust-chapter
   #:name* "variables"
   #:version* "0.1.0"
   #:hash "0j8pc4ms45wrr7371sinbgx7y0lb33xz8fliwkxgqahhfx92ss3x"
   #:dir "variables"
   #:deps '()
   #:desc "About variables in Rust."))

(define-public functions
  #:name* "functions"
  #:version* "0.1.0"
  #:hash  "0j8pc4ms45wrr7371sinbgx7y0lb33xz8fliwkxgqahhfx92ss3x"
  #:dir "functions"
  #:deps '()
  #:desc "About functions in Rust.")
