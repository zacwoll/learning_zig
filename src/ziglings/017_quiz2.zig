//
// Quiz time again! Let's see if you can solve the famous "Fizz Buzz"!
//
//     "Players take turns to count incrementally, replacing
//      any number divisible by three with the word "fizz",
//      and any number divisible by five with the word "buzz".
//          - From https://en.wikipedia.org/wiki/Fizz_buzz
//
// Let's go from 1 to 16. This has been started for you, but there
// are some problems. :-(
//

// import std using @import("std")
// const std = import standard library;
const std = @import("std");

// Use pub and fn to expose the function publicly and declare it as a function
// function main() void {
pub fn main() void {
    var i: u8 = 1;
    const stop_at: u8 = 16;

    // What kind of loop is this? A 'for' or a 'while'?
	// There's a condition, so it's a while loop, a for loop iterates over a collection
    while (i <= stop_at) : (i += 1) {
        if (i % 3 == 0) std.debug.print("Fizz", .{});
        if (i % 5 == 0) std.debug.print("Buzz", .{});
        if (!(i % 3 == 0) and !(i % 5 == 0)) {
			// print the value held by i
			// std.debug.print("{}", .{???});
            std.debug.print("{}", .{i});
        }
		// I added this line to avoid ending the sequence with a comma
		if (i == stop_at) break;
        std.debug.print(", ", .{});
    }
    std.debug.print("\n", .{});
}
