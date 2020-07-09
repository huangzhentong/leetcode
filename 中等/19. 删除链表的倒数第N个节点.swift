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
/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var list = [ListNode]()
        
        var nextNode = head
        while nextNode != nil {
            list.append(nextNode!);
            nextNode = nextNode?.next
        }
        if list.count == 1 {
            return nil
        }
        
        //移除最后一位
        else if n == 1 {
            let lastNode =  list[list.count-2]
            lastNode.next = nil
        }
        else if(n == list.count)
        {
            return list[1]
        }
        else {
           
            let deleteNodeNum = (list.count - n)
            let deleteNode = list[deleteNodeNum]
            let previousNode = list[deleteNodeNum-1]
            previousNode.next = deleteNode.next
        }
        return head
    }
}
