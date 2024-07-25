//You are given the heads of two sorted linked lists list1 and list2.

// Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

// Return the head of the merged linked list.
// struct ListNode* mergeTwoLists(struct ListNode* list1, struct ListNode* list2) {
const std = @import("std");

const ListNode = struct {
    val: u8 = 0,
    next: ?*ListNode = null,

    pub fn init(val: u8, next: ?*ListNode) ListNode {
        return ListNode{
            .val = val,
            .next = next,
        };
    }
};

// pub fn mergeTwoLists(list1: *ListNode, list2: *ListNode) *ListNode {
//     _ = list1;
//     _ = list2;
// }

pub fn main() void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
	_ = allocator;

    // const node = allocator.create(ListNode.init(4, null));
    // defer allocator.destroy(node);

	const node = &ListNode {
		.val = 4,
		.next = null,
	};
	const node2 = &ListNode {
		.val = 5,
		.next = @constCast(node),
	};

    std.debug.print("The node's value is {}", .{node2.*.val});
}
