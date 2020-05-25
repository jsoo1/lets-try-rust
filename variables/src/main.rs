fn main() {
    let mut x = 5;
    println!("x: {}", x);
    x = 6;
    println!("x: {}", x);

    let tup: (u32, f64, u8) = (500, 60.000, 2);
    let (x, y, z) = tup;
    println!("x: {}, y: {}, z: {}", x, y, z);
    let x = tup.0;
    let y = tup.1;
    let z = tup.2;
    println!("x: {}, y: {}, z: {}", x, y, z);
}
