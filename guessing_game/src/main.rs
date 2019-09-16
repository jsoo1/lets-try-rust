use std::io;

fn main() {
    println!("Guess, my guy.");
    let mut guess = String::new();
    io::stdin().read_line(&mut guess).expect(
        "Failed to read guess.",
    );
    println!("You guessed: {}", guess);
}
