//
// Now that we've learned about arrays, we can talk about strings.
//
// We've already seen Zig string literals: "Hello world.\n"
//
// Zig stores strings as arrays of bytes.
//
//     const foo = "Hello";
//
// Is almost* the same as:
//
//     const foo = [_]u8{ 'H', 'e', 'l', 'l', 'o' };
//
// (* We'll see what Zig strings REALLY are in Exercise 77.)
//
// Notice how individual characters use single quotes ('H') and
// strings use double quotes ("H"). These are not interchangeable!
//
const std = @import("std");

pub fn main() void {
    const ziggy = "stardust";

    // (Problem 1)
    // Use array square bracket syntax to get the letter 'd' from
    // the string "stardust" above.

	// the letter 'd' is at index [4]
	// const d: u8 = ziggy[???];
    const d: u8 = ziggy[4];

    // (Problem 2)
    // Use the array repeat '**' operator to make "ha ha ha ".
	// Apply the operator with the scalar 3 to length "ha " to "ha ha ha "
    // const laugh = "ha " ???;
    const laugh = "ha " ** 3;

    // (Problem 3)
    // Use the array concatenation '++' operator to make "Major Tom".
    // (You'll need to add a space as well!)
    const major = "Major";
    const tom = "Tom";
	// concatenate the literals and place a " " between them.
	// const major_tom = major ??? tom;
    const major_tom = major ++ " " ++ tom;

    // That's all the problems. Let's see our results:
    std.debug.print("d={u} {s}{s}\n", .{ d, laugh, major_tom });
    // Keen eyes will notice that we've put 'u' and 's' inside the '{}'
    // placeholders in the format string above. This tells the
    // print() function to format the values as a UTF-8 character and
    // UTF-8 strings respectively. If we didn't do this, we'd see '100',
    // which is the decimal number corresponding with the 'd' character
    // in UTF-8. (And an error in the case of the strings.)
    //
    // While we're on this subject, 'c' (ASCII encoded character)
    // would work in place for 'u' because the first 128 characters
    // of UTF-8 are the same as ASCII!
    //
}
