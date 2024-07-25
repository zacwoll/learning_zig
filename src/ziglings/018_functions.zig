//
// Functions! We've already created lots of functions called 'main()'. Now let's
// do something different:
//
//     fn foo(n: u8) u8 {
//         return n + 1;
//     }
//
// The foo() function above takes a number 'n' and returns a number that is
// larger by one.
//
// Note the input parameter 'n' and return types are both u8.
//
const std = @import("std");

pub fn main() void {
    // The new function deepThought() should return the number 42. See below.
    const answer: u8 = deepThought();

    std.debug.print("Answer to the Ultimate Question: {}\n", .{answer});
}

// Please define the deepThought() function below.
//
// We're just missing a couple things. One thing we're NOT missing is the
// keyword "pub", which is not needed here. Can you guess why?
// 
// pub isn't needed here because pub exposes the function publicly to all files that reference this one.
// This function is used only by this file and so we omit the pub declaration entirely, leaving `fn`
// The function is expected to return a u8 on line 18 so we'll type the function to return one and the
// literal `42` will be implicitly cast as one
// ??? deepThought() ??? {
fn deepThought() u8 {
    return 42; // Number courtesy Douglas Adams
}
