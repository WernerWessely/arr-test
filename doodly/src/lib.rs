#![feature(restricted_std)]

use generic_array::arr;

#[no_mangle]
pub unsafe extern "C" fn suma(a: i32, b: i32) -> i32 {
    do_something(a, b)
}

fn do_something(a: i32, b: i32) -> i32 {
    let array = arr![i32; a, b, 1, 2, 3, 4];

    array.iter().sum()
}
