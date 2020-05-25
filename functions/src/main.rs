fn main() {
    another_function(4, 5);
    yet_another_function();
    println!("The value of five() is: {}", five());
    println!("The value of plus_one(five()) is: {}", plus_one(five()));
}

fn another_function(x : i32, y : i32) {
    println!("The value of x is {}:", x);
    println!("The value of y is {}:", y);
}

fn yet_another_function() {
    let a = 3;

    let b = {
        let a = 4;
        a + 1
    };

    println!("The value of a is: {}", a);
    println!("The value of b is: {}", b);
}

fn five() -> i32 {
    5
}

fn plus_one(x : i32) -> i32 {
    x + 1
}
