use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("Guess, my guy.");
    let secret = rand::thread_rng().gen_range(0, 100);
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect(
        "Failed to read guess.",
    );
    println!("You guessed: {}", guess);

    match guess.cmp(&secret) {
        Ordering::Less => println!("Too small"),
        Ordering::Greater => println!("Too big"),
        Ordering::Equal => println!("You win!"),
    };

    println!("Number was {}", secret);
}
