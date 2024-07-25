// Given an array of integers nums and an integer target,
// return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution,
// and you may not use the same element twice.

// You can return the answer in any order.
const std = @import("std");

pub fn main() !void {
    // Random Number Source
    var prng = std.Random.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();
    // Generate arr of random length and target
    const random_length = rand.intRangeAtMost(u8, 2, 100);
    const target = rand.intRangeAtMost(i9, -255, 255);

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // Allocate random amount of space for array, 2<length<100 * i9 data type
    var arr = try allocator.alloc(i9, random_length);
    defer allocator.free(arr);

    // Fill array dynamically with random i9s
    for (0..arr.len) |i| {
        arr[i] = rand.intRangeAtMost(i9, -255, 255);
    }
    std.debug.print("Target: {d}\n", .{target});
    std.debug.print("{any}\n", .{arr[0..]});

    // result of twoSum is {0, 0} or { index i, index j}
    const A = try (twoSum(allocator, &arr, target));
    if (A[0] == 0 and A[1] == 0) {
        std.debug.print("{s}", .{"Target not found\n"});
        return;
    }
    std.debug.print("\n[{}, {}] = ", .{ A[0], A[1] });
    std.debug.print("{} + {} = {}\n", .{ arr[A[0]], arr[A[1]], target });

    std.debug.print("{any}\n", .{A[0..]});

    return;
}

//int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
pub fn twoSum(allocator: std.mem.Allocator, nums: *[]i9, target: i9) ![2]usize {
    var indices = [_]usize{ 0, 0 };

    var complements_hash_map = std.AutoHashMap(i64, usize).init(allocator);
    defer complements_hash_map.deinit();

    for (nums.*, 0..) |num, i| {
        const complement = @as(i64, target) - @as(i64, num);

        std.debug.print("complement = {} - {} = {}\n", .{ target, num, complement });
        if (complements_hash_map.get(complement)) |existing| {
            indices[0] = existing;
            indices[1] = i;
            return indices;
        }
        try (complements_hash_map.put(num, i));
    }
    return indices;
}
