const std = @import("std");

pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const distance_from_center = std.math.sqrt( self.x * self.x + self.y * self.y);
        if (distance_from_center >= 0 and distance_from_center <= 1) return 10
        else if (distance_from_center > 1 and distance_from_center <= 5) return 5
        else if (distance_from_center > 5 and distance_from_center <= 10) return 1
        else return 0;
    }
};

pub fn main() !void {
    const throw_1 = Coordinate{
        .x = 0,
        .y = 0,
    };
    std.debug.print("Throw: {{{d},{d}}} Score: {d}\n", .{ throw_1.x, throw_1.y, throw_1.score() });
    const throw_2 = Coordinate{
        .x = -9,
        .y = 2,
    };
    std.debug.print("Throw: {{{d},{d}}} Score: {d}\n", .{ throw_2.x, throw_2.y, throw_2.score() });
    const throw_3 = Coordinate{
        .x = 10,
        .y = 100,
    };
    std.debug.print("Throw: {{{d},{d}}} Score: {d}\n", .{ throw_3.x, throw_3.y, throw_3.score() });
}
