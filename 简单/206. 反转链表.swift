//
//  206. 反转链表.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//
//反转一个单链表。
//
//示例:
//
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
//进阶:
//你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/reverse-linked-list
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        var nextNode = ListNode.init(head!.val);
        var lastNode = head!.next
        while (lastNode != nil)   {
            let nextNode2 = ListNode.init(lastNode!.val)
            nextNode2.next = nextNode
            nextNode = nextNode2
            lastNode = lastNode?.next
        }
   
        return nextNode
    }
}
