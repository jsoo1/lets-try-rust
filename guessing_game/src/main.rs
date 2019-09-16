use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    let secret = rand::thread_rng().gen_range(0, 100);

    loop {
        println!("Guess, my guy.");

        let mut guess = String::new();
        io::stdin().read_line(&mut guess).expect(
            "Failed to read guess.",
        );

        let guess: u32 = guess.trim().parse().expect("Please enter a number");

        match guess.cmp(&secret) {
            Ordering::Less => println!("Too small"),
            Ordering::Greater => println!("Too big"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        };
    }
}
