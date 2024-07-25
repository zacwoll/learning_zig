// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// An input string is valid if:

//     Open brackets must be closed by the same type of brackets.
//     Open brackets must be closed in the correct order.
//     Every close bracket has a corresponding open bracket of the same type.
// bool isValid(char* s) {
const std = @import("std");
const print = std.debug.print;
const OPEN = "[{(";
const CLOSE = "]})";

const O = [_]u8{ '[', '{', '(' };
const C = [_]u8{ ']', '}', ')' };

pub fn getOpenIndex(s: u8) usize {
    for (OPEN, 0..) |open_bracket, index| {
        if (open_bracket == s) {
            return index;
        }
    }
    return OPEN.len;
}
pub fn getCloseIndex(s: u8) usize {
    for (CLOSE, 0..) |close_bracket, index| {
        if (close_bracket == s) {
            return index;
        }
    }
    return CLOSE.len;
}

pub fn isValid(allocator: std.mem.Allocator, s: []const u8) !bool {
    print("{s}\n", .{s});
    var hasAtLeastOne = false;

    var pairs = std.ArrayList(u8).init(allocator);
    defer pairs.deinit();

    for (s) |char| {
        if (getOpenIndex(char) < OPEN.len) {
            try pairs.append(char);
            hasAtLeastOne = true;
        }
        const close_index = getCloseIndex(char);
        if (close_index < CLOSE.len) {
            if (pairs.items.len == 0) continue;
            const popped = pairs.pop();
            const open_bracket = OPEN[close_index];

            if (popped == open_bracket) {
                print("{c} == {c}\n", .{ popped, open_bracket });
            } else {
                return false;
            }
        }
    }
    if (hasAtLeastOne == true and pairs.items.len == 0) {
        print("{any}\n", .{true});
        return true;
    }
    print("{any}\n", .{false});
    return false;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    _ = try isValid(allocator, "hello");
    _ = try isValid(allocator, "())");
    _ = try isValid(allocator, "()[]{}");
}

const testing = std.testing;
test "hello" {
    try testing.expect(try isValid(std.testing.allocator, "hello") == false);
}

test "({)" {
    try testing.expect(try isValid(std.testing.allocator, "({)") == false);
}

test "()[]{}" {
    try testing.expect(try isValid(std.testing.allocator, "({)") == false);
}
