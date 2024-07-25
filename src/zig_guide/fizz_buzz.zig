const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var count: u8 = 1;
    while (count <= 100) : (count += 1) {
        if (count % 3 == 0 and count % 5 == 0) {
            try stdout.print("{s}\n", .{"FizzBuzz"});
        } else if (count % 3 == 0) {
            try stdout.print("{s}\n", .{"Fizz"});
        } else if (count % 5 == 0) {
            try stdout.print("{s}\n", .{"Buzz"});
        } else {
            try stdout.print("{}\n", .{count});
        }
    }
}
