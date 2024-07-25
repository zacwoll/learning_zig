//
// Let's learn some array basics. Arrays are declared with:
//
//   var foo: [3]u32 = [3]u32{ 42, 108, 5423 };
//
// When Zig can infer the size of the array, you can use '_' for the
// size. You can also let Zig infer the type of the value so the
// declaration is much less verbose.
//
//   var foo = [_]u32{ 42, 108, 5423 };
//
// Get values of an array using array[index] notation:
//
//     const bar = foo[2]; // 5423
//
// Set values of an array using array[index] notation:
//
//     foo[2] = 16;
//
// Get the length of an array using the len property:
//
//     const length = foo.len;
//
const std = @import("std");

pub fn main() void {
    // (Problem 1)
    // This "const" is going to cause a problem later - can you see what it is?
    // How do we fix it?
	// const prevents some_primes from having mutable values, so replace with var
	// const some_primes = [_]u8{ 1, 3, 5, 7, 11, 13, 17, 19 };	
    var some_primes = [_]u8{ 1, 3, 5, 7, 11, 13, 17, 19 };

    // Individual values can be set with '[]' notation.
    // Example: This line changes the first prime to 2 (which is correct):
    some_primes[0] = 2;

    // Individual values can also be accessed with '[]' notation.
    // Example: This line stores the first prime in "first":
    const first = some_primes[0];

    // (Problem 2)
    // Looks like we need to complete this expression. Use the example
    // above to set "fourth" to the fourth element of the some_primes array:
	// Index missing from array dereference, replace with '3' for 4th element
    // const fourth = some_primes[???];
    const fourth = some_primes[3];

    // (Problem 3)
    // Use the len property to get the length of the array:
	// len is a property of all arrays because length is known at compile time
    // const length = some_primes.???;
	    const length = some_primes.len;

    std.debug.print("First: {}, Fourth: {}, Length: {}\n", .{
        first, fourth, length,
    });
}
