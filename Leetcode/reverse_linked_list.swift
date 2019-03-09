/*
Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
// class Solution {
//     func reverseList(_ head: ListNode?) -> ListNode? {
//         var pre: ListNode? = nil
//         var curr: ListNode? = head
//         while(curr != nil) {
//             let nextListNode = curr!.next

//             curr!.next = pre
//             pre = curr
//             curr = nextListNode
//         }
//         return pre
//     }
// }

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
       if (head!.next == nil) { return head }
        let second = head!.next
        let listNode = reverseList(second!)
        second!.next = head
        head!.next = nil
        return listNode
    }
}
